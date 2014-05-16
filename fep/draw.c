/*

  Copyright (c) 2003-2013 uim Project http://code.google.com/p/uim/

  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:

  1. Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
  3. Neither the name of authors nor the names of its contributors
     may be used to endorse or promote products derived from this software
     without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.

*/

/*
 * �ץꥨ�ǥ��åȤ䥹�ơ������饤������褹��
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif
#if (!defined(DEBUG) && !defined(NDEBUG))
#define NDEBUG
#endif
#ifdef HAVE_STRING_H
#include <string.h>
#endif
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif
#ifdef HAVE_ASSERT_H
#include <assert.h>
#endif
#include <stdio.h>

#define WINNOSIZE 5
#define MODESIZE 50

#include "uim-fep.h"
#include "callbacks.h"
#include "escseq.h"
#include "draw.h"
#include "str.h"
#include "udsock.h"

/* ���ߥåȤ���Ƥ�����Ϥ����ޤ�TRUE */
int g_commit = FALSE;
/* s_preedit->width > 0��Ʊ�� */
int g_start_preedit = FALSE;

/* ���ߤΥץꥨ�ǥ��å� */
static struct preedit_tag *s_preedit;
/* ���ߥåȤ��줿�Ȥ��Υץꥨ�ǥ��åȤ���¸���� */
static struct preedit_tag s_save_preedit;
/* �ץꥨ�ǥ��åȤ���Ƭ�ΰ��� */
static struct point_tag s_head;
/* �Կ� -> �����Υ���� */
static int *s_line2width = NULL;
static int *s_prev_line2width = NULL;
/* �ץꥨ�ǥ��åȤιԿ� */
static int s_preedit_lines = 0;
static int s_prev_preedit_lines = 0;

/* ����ü���ޥ����Υե����뵭�һ� */
static int s_master;
/* �⡼�ɾ���ʸ���� */
static char s_modebuf[MODESIZE];
/* ������� */
static char s_candbuf[CANDSIZE];
/* GNU screen��WINDOW�ֹ� */
static char s_win_no[WINNOSIZE];
/* �⡼�ɾ��֤�񤭹���ե����� */
static const char *s_path_getmode;
/* ü�����������Ѵ������Ȥ�TRUE */
static int s_winch = FALSE;

static void init_backtick(void);
static void start_preedit(void);
static void end_preedit(void);
static void draw_statusline(int force, int restore, int visible, int draw_background);
static void draw_preedit(struct preedit_tag *preedit, struct preedit_tag *prev_preedit);
static int is_eq_region(void);
static void draw_subpreedit(struct preedit_tag *p, int start, int end);
static void draw_pseg(struct preedit_segment_tag *pseg, int start_width);
static int compare_preedit(struct preedit_tag *p1, struct preedit_tag *p2);
static int compare_preedit_rev(struct preedit_tag *p1, struct preedit_tag *p2);
static int min(int a, int b);
static void erase_prev_preedit(void);
static void erase_preedit(void);
static void set_line2width(struct preedit_tag *preedit);
static void goto_char(int width);
static void goto_col(int width);
static struct point_tag width2point_char(int width);
static struct point_tag width2point_col(int width);
static int width2lineno_char(int width);
static int width2lineno_col(int width);

#if defined(DEBUG) && DEBUG > 2
static void print_preedit(struct preedit_tag *p);
#endif

void init_draw(int master, const char *path_getmode)
{
  s_master = master;
  s_path_getmode = path_getmode;
  s_preedit = create_preedit();
  if (g_opt.status_type == BACKTICK) {
    init_backtick();
  }
}

static void init_backtick(void)
{
  if (getenv("WINDOW")) {
    snprintf(s_win_no, sizeof(s_win_no), "%s ", getenv("WINDOW"));
  }
}

void update_backtick(void)
{
  char sendbuf[CANDSIZE];
  if (s_candbuf[0] == '\0') {
    /* �⡼��ɽ�� */
    snprintf(sendbuf, sizeof(sendbuf), "%s%s", s_win_no, s_modebuf);
  } else {
    /* �������ɽ�� */
    strlcpy(sendbuf,  s_candbuf, sizeof(sendbuf));
  }
  sendline(sendbuf);
}

/*
 * �ץꥨ�ǥ��åȡ����ơ������饤������褹��
 * ���̤���ɬ�פ��ʤ�����FALSE���֤�
 */
int draw(void)
{
  char *commit_str;

  struct preedit_tag *prev_preedit;

  int i;

  if (!end_callbacks()) {
    return FALSE;
  }

  prev_preedit = s_preedit;
  s_preedit = get_preedit();
  commit_str = get_commit_str();

  /* ü�����������ѹ����줿�Ȥ���s_head���ѹ���������preedit���ʤ��ä����Ȥˤ��� */
  if (s_winch && g_start_preedit) {
    if (g_opt.no_report_cursor) {
      s_preedit->cursor = 0;
    } else {
      s_head = get_cursor_position();
    }
    end_preedit();
    free_preedit(prev_preedit);
    prev_preedit = create_preedit();
  }
  s_winch = FALSE;

  debug2(("draw()\n"));
  debug2(("commit_str = \"%s\"\n", commit_str));
  debug2(("preedit->width = %d\n", s_preedit->width));

  /* ��¸���Ƥ������ץꥨ�ǥ��åȤϤ⤦����ʤ� */
  for (i = 0; i < s_save_preedit.nr_psegs; i++) {
    free(s_save_preedit.pseg[i].str);
  }
  s_save_preedit.width = s_save_preedit.cursor = s_save_preedit.nr_psegs = 0;

  /* �ץꥨ�ǥ��åȤ�̵����Х���������᤹ */
  draw_statusline(FALSE, !g_start_preedit || g_opt.no_report_cursor, FALSE, FALSE);

  /* ���ߥåȤ��줿�� */
  if (commit_str[0] != '\0') {
    g_commit = TRUE;
    /* �ץꥨ�ǥ��åȤ�ä�ɬ�פ����뤫 */
    if (prev_preedit->width > 0) {
      put_cursor_invisible();
      if (g_opt.no_report_cursor) {
        put_cursor_left(prev_preedit->cursor);
        if (g_opt.on_the_spot) {
          put_delete(prev_preedit->width);
        } else {
          put_erase(prev_preedit->width);
          put_cursor_left(prev_preedit->width);
        }
      } else {
        erase_preedit();
      }
      end_preedit();
    }
    write(s_master, commit_str, strlen(commit_str));
  }
  if (!g_commit) {
    /* ����ޤ��Ͼõ��ץꥨ�ǥ��åȤ����뤫 */
    if (s_preedit->width != 0 || prev_preedit->width != 0) {
      if (prev_preedit->width == 0) {
        start_preedit();
      }
      draw_preedit(s_preedit, prev_preedit);
      if (s_preedit->width == 0) {
        end_preedit();
      }
    }
  } else { /* if (g_commit) */
    if (s_preedit->width > 0) {
      /* ���ߥåȤ��줿�Ȥ��˥ץꥨ�ǥ��åȤ����ä��Τǡ��夫����Ϥ�
       * �뤿��˥ץꥨ�ǥ��åȤ���¸����  */
      s_save_preedit = *s_preedit;
    }
    s_preedit->width = s_preedit->cursor = s_preedit->nr_psegs = 0;
  }

  free_preedit(prev_preedit);
  free(commit_str);
  put_cursor_normal();

  debug2(("\ndraw end\n"));
  return TRUE;
}

/*
 * �ץꥨ�ǥ��åȤ򳫻Ϥ���Ȥ��˸Ƥ�
 */
static void start_preedit(void)
{
  if (!g_start_preedit) {
    debug2(("start_preedit()\n"));
    g_start_preedit = TRUE;
    if (g_opt.no_report_cursor) {
      return;
    }

    s_head = get_cursor_position();
    if (s_head.col == g_win->ws_col - 1) {
      s_head.col = 0;
      if (s_head.row == g_win->ws_row - 1) {
        put_crlf();
      } else {
        s_head.row++;
      }
    }
    debug2(("s_head.row = %d s_head.col = %d\n", s_head.row, s_head.col));
    s_line2width = uim_malloc(sizeof(int));
    s_line2width[0] = s_head.col;
    s_preedit_lines = 1;
  }
}

/*
 * �ץꥨ�ǥ��åȤ�λ����Ȥ��˸Ƥ�
 * ��������ϥץꥨ�ǥ��åȳ��ϰ��֤˰�ư
 */
static void end_preedit(void)
{
  debug2(("end_preedit()\n"));
  assert(g_start_preedit);
  g_start_preedit = FALSE;
  if (g_opt.no_report_cursor) {
    return;
  }

  put_cursor_address_p(&s_head);
  s_preedit_lines = 0;
  if (s_line2width != NULL) {
    free(s_line2width);
    s_line2width = NULL;
  }
  if (s_prev_line2width != NULL) {
    free(s_prev_line2width);
    s_prev_line2width = NULL;
  }
}

/*
 * ���ߥåȤȥץꥨ�ǥ��åȤ�Ʊ����ȯ������
 * ���θ塤���ߥåȤ���Ϥ����Ȥ���TRUE���֤�
 */
int is_commit_and_preedit(void)
{
  return !g_commit && s_save_preedit.width > 0;
}

/*
 * is_commit_and_preedit() == TRUE�ΤȤ��˸ƤФ졤
 * �ץꥨ�ǥ��åȤ���Ϥ���
 */
void draw_commit_and_preedit(void)
{
  assert(is_commit_and_preedit());
  assert(s_preedit->width == 0);
  *s_preedit = s_save_preedit;
  s_save_preedit.width = 0;
  s_save_preedit.cursor = 0;
  s_save_preedit.nr_psegs = 0;
  start_preedit();
  /* prev_preedit�϶� */
  draw_preedit(s_preedit, &s_save_preedit);
  put_cursor_normal();
}

/*
 * ���ơ������饤������褹��
 * force��TRUE�ΤȤ��Ͼ��֤��Ѥ�äƤʤ��Ƥ����褹��
 * restore��TRUE�ΤȤ��ϥ�������򳫻ϰ��֤��᤹
 * visible��TRUE�ΤȤ��Ͻ�λ��˥��������ɽ������
 * draw_background��TRUE�ΤȤ����طʿ����ɤ�Ĥ֤�
 */
static void draw_statusline(int force, int restore, int visible, int draw_background)
{
  static char *statusline_str = NULL;
  static int statusline_str_width = 0;
  static char *candidate_str = NULL;
  static int candidate_col = UNDEFINED;
  static char *mode_str = NULL;
  static char *index_str = NULL;
  static int index_col = UNDEFINED;

  char *prev_statusline_str;
  int prev_statusline_str_width;
  char *prev_candidate_str;
  int prev_candidate_col;
  char *prev_mode_str;
  char *prev_index_str;
  int prev_index_col;

  /* static�ѿ��ν���� 1�󤷤��¹Ԥ���ʤ� */
  if (statusline_str == NULL) {
    statusline_str = uim_strdup("");
  }
  if (candidate_str == NULL) {
    candidate_str = uim_strdup("");
  }
  if (index_str == NULL) {
    index_str = uim_strdup("");
  }
  if (mode_str == NULL) {
    mode_str = uim_strdup("");
  }

  prev_statusline_str = statusline_str;
  prev_statusline_str_width = statusline_str_width;
  prev_candidate_str = candidate_str;
  prev_candidate_col = candidate_col;
  prev_mode_str = mode_str;
  prev_index_str = index_str;
  prev_index_col = index_col;

  statusline_str = get_statusline_str();
  candidate_str = get_candidate_str();
  candidate_col = get_candidate_col();
  mode_str = get_mode_str();
  index_str = get_index_str();
  index_col = get_index_col();

  debug2(("draw_statusline()\n"));
  debug2(("statusline_str = \"%s\"\n", statusline_str));
  debug2(("candidate_str = \"%s\"\n", candidate_str));
  debug2(("candidate_col = %d\n", candidate_col));
  debug2(("prev_mode_str = %s\n", prev_mode_str));
  debug2(("mode_str = %s\n", mode_str));
  debug2(("index_str = \"%s\"\n", index_str));
  debug2(("index_col = %d\n", index_col));

  /* ���������õ� */
  if (statusline_str[0] == '\0' && prev_statusline_str[0] != '\0') {
    if (g_opt.status_type == LASTLINE) {
      /* ���������ä�����ϥ⡼�ɤ����褹��ɬ�פ����� */
      force = TRUE;
    } else if (g_opt.status_type == BACKTICK) {
      s_candbuf[0] = '\0';
    }
  } else {
    /* ��������������� */ 
    if (strcmp(statusline_str, prev_statusline_str) != 0 || (force && statusline_str[0] != '\0')) {
      /* ��������������ʤΤ�����θ���Ϥʤ� */
      prev_candidate_col = UNDEFINED;
      prev_index_col = UNDEFINED;
      if (g_opt.status_type == LASTLINE) {
        if (restore) {
          put_save_cursor();
        }
        put_cursor_invisible();
        put_goto_lastline(0);
        /* ���䤬���򤵤�Ƥ��뤫 */
        if (candidate_col != UNDEFINED) {
          int byte_cand = (width2byte(statusline_str, candidate_col))[0];
          int byte_index;
          put_uim_str_len(statusline_str, UPreeditAttr_None, byte_cand);
          put_uim_str(candidate_str, UPreeditAttr_Reverse);
          if (index_col == UNDEFINED) {
            put_uim_str(statusline_str + byte_cand + strlen(candidate_str), UPreeditAttr_None);
          } else {
            if (g_opt.ddskk) {
              put_uim_str(statusline_str + byte_cand + strlen(candidate_str), UPreeditAttr_None);
            } else {
              byte_index = (width2byte(statusline_str, index_col))[0];
              put_uim_str_len(statusline_str + byte_cand + strlen(candidate_str),
                  UPreeditAttr_None,
                  byte_index - byte_cand - strlen(candidate_str));
              put_uim_str(index_str, UPreeditAttr_None);
              put_uim_str(statusline_str + byte_index + strlen(index_str), UPreeditAttr_None);
            }
          }
        } else {
          put_uim_str(statusline_str, UPreeditAttr_None);
        }
        statusline_str_width = strwidth(statusline_str);
        if (draw_background) {
          put_clear_to_end_of_line(g_win->ws_col - statusline_str_width);
        } else if (statusline_str_width < prev_statusline_str_width) {
          put_clear_to_end_of_line(prev_statusline_str_width - statusline_str_width);
        }
        goto end_candidate;
      } else if (g_opt.status_type == BACKTICK) {
        strlcpy(s_candbuf, statusline_str, CANDSIZE);
      }
    }
    if (prev_candidate_col != candidate_col) {
      /* ����θ����ȿž���᤹ */
      if (prev_candidate_col != UNDEFINED) {
        if (g_opt.status_type == LASTLINE) {
          if (restore) {
            put_save_cursor();
          }
          put_cursor_invisible();
          put_goto_lastline(prev_candidate_col);
          put_uim_str(prev_candidate_str, UPreeditAttr_None);
        }
      }
      /* ���򤵤줿�����ȿž���� */
      if (candidate_col != UNDEFINED) {
        if (g_opt.status_type == LASTLINE) {
          if (restore) {
            put_save_cursor();
          }
          put_cursor_invisible();
          put_goto_lastline(candidate_col);
          put_uim_str(candidate_str, UPreeditAttr_Reverse);
        } else if (g_opt.status_type == BACKTICK) {
          int byte;
          strlcpy(s_candbuf, statusline_str, CANDSIZE);
          byte = (width2byte(statusline_str, candidate_col))[0] + strlen(candidate_str);
          if (0 <= byte && byte <= CANDSIZE - 1) {
            s_candbuf[byte] = ']';
          }
          byte -= (strlen(candidate_str) + 1);
          if (0 <= byte && byte <= CANDSIZE - 1) {
            s_candbuf[byte] = '[';
          }
        }
      }
    }
    if (index_col != UNDEFINED && !g_opt.ddskk) {
      if (g_opt.status_type == LASTLINE) {
        int i = 0;
        if (restore) {
          put_save_cursor();
        }
        put_cursor_invisible();
        /* index_str��ascii */
        if (prev_index_col != UNDEFINED) {
          for (i = 0; i < (int)strlen(index_str); i++) {
            if (index_str[i] != prev_index_str[i]) {
              break;
            }
          }
        }
        if (i < (int)strlen(index_str)) {
          put_goto_lastline(index_col + i);
          put_uim_str(index_str + i, UPreeditAttr_None);
        }
      } else if (g_opt.status_type == BACKTICK) {
        memcpy(s_candbuf + (width2byte(statusline_str, index_col))[0], index_str, strlen(index_str));
      }
    }
  }
end_candidate:

  if (force || strcmp(mode_str, prev_mode_str) != 0) {

    /* ���ߤΥ⡼�ɤ�UIM_FEP_GETMODE�˽񤭹��� */
    if (s_path_getmode[0] != '\0') {
      FILE *fp = fopen(s_path_getmode, "wt");
      if (fp) {
        int mode = get_mode();
        fprintf(fp, "%d\n", mode);
        fclose(fp);
      }
    }

    if (g_opt.status_type != NONE && statusline_str[0] == '\0') {
      if (g_opt.status_type == LASTLINE) {
        int mode_str_width = strwidth(mode_str);

        statusline_str_width = mode_str_width;

        if (restore) {
          put_save_cursor();
        }
        put_cursor_invisible();

        /* draw_background �ʤ�� force �Ǥ��� */
        /* ����Ū�ˤϴط��ʤ������Τ褦�ʻȤ�����������Ƥ��ʤ� */
        assert(!draw_background || force);

        if (force) {
          put_goto_lastline(0);
          put_uim_str(mode_str, UPreeditAttr_None);

          if (draw_background) {
            put_clear_to_end_of_line(g_win->ws_col - statusline_str_width);
          } else if (statusline_str_width < prev_statusline_str_width) {
            put_clear_to_end_of_line(prev_statusline_str_width - statusline_str_width);
          }

        } else {
          /* !force �ʤΤ� prev_statusline_str_width �ϥ⡼��ɽ����Ĺ���Ǥ��� */
          int eq_width = compare_str(mode_str, prev_mode_str);
          int eq_byte = width2byte(mode_str, eq_width)[0];
          int prev_mode_str_width = strwidth(prev_mode_str);

          put_goto_lastline(eq_width);
          if (mode_str_width == prev_mode_str_width) {
            int eq_width_rev = compare_str_rev(mode_str, prev_mode_str);

            if (eq_width_rev > 0) {
              int draw_byte = width2byte(mode_str + eq_byte, mode_str_width - eq_width - eq_width_rev)[0];
              put_uim_str_len(mode_str + eq_byte, UPreeditAttr_None, draw_byte);

            } else {
              put_uim_str(mode_str + eq_byte, UPreeditAttr_None);
            }
            
          } else {
            put_uim_str(mode_str + eq_byte, UPreeditAttr_None);
            if (statusline_str_width < prev_statusline_str_width) {
              put_clear_to_end_of_line(prev_statusline_str_width - statusline_str_width);
            }
          }
        }

      } else if (g_opt.status_type == BACKTICK) {
        strlcpy(s_modebuf, mode_str, sizeof(s_modebuf));
      }
    }
  }
  free(prev_candidate_str);
  free(prev_statusline_str);
  free(prev_index_str);
  free(prev_mode_str);
  if (restore) {
    put_restore_cursor();
  }
  if (g_opt.status_type == BACKTICK) {
    update_backtick();
  }
  if (visible) {
    put_cursor_normal();
  }
  debug2(("draw_statusline end\n"));
}

/*
 * ���ơ������饤��Υ⡼��ɽ����mode�ˤ���
 * ����������֤��Ѥ��ʤ�
 */
void draw_statusline_restore(void)
{
  if (!end_callbacks()) {
    if (g_opt.status_type == BACKTICK) {
      update_backtick();
    }
    return;
  }
  draw_statusline(FALSE, TRUE, TRUE, FALSE);
}

/*
 * �ǲ��Ԥ�����褹��
 * ��������Ϻǲ��Ԥ˰�ư����
 */
void draw_statusline_force_no_restore(void)
{
  end_callbacks();
  draw_statusline(TRUE, FALSE, FALSE, TRUE);
}

/*
 * �ǲ��Ԥ�����褹��
 * ����������֤��Ѥ��ʤ�
 */
void draw_statusline_force_restore(void)
{
  end_callbacks();
  draw_statusline(TRUE, TRUE, TRUE, TRUE);
}

/*
 * �ǲ��Ԥ�ä�
 * ��������Ϻǲ��Ԥ˰�ư����
 */
void clear_lastline(void)
{
  assert(g_opt.status_type == LASTLINE);
  put_goto_lastline(0);
  put_clear_to_end_of_line(g_win->ws_col);
}

/*
 * backtick��ä�
 */
void clear_backtick(void)
{
  assert(g_opt.status_type == BACKTICK);
  sendline("");
}

/*
 * �ץꥨ�ǥ��åȤ����褹��
 * ���ϻ��Υ���������֤�Ǥ��
 * ��λ���Υ���������֤�preedit->cursor
 */
static void draw_preedit(struct preedit_tag *preedit, struct preedit_tag *prev_preedit)
{
  int eq_width;

  /* ü�����������ѹ����줿�Ȥ���prev_preedit��̵�뤹�� */
  eq_width = compare_preedit(preedit, prev_preedit);

#if DEBUG > 2
  debug2(("\neq_width = %d\n", eq_width));
  debug2(("prev    "));
  print_preedit(prev_preedit);
  debug2(("\n"));
  debug2(("preedit "));
  print_preedit(preedit);
  debug2(("\n"));
#endif

  /* �ץꥨ�ǥ��åȤ������ʳ����Խ����Ƥ���Ȥ���prev_preedit���ѹ�����Ȥ��ϥ��������ä� */
  if (preedit->cursor != preedit->width || eq_width != prev_preedit->width) {
    put_cursor_invisible();
  }

  /* preedit == prev_preedit�ΤȤ��ϡ���������ΰ�ư���� */
  if (eq_width == preedit->width && eq_width == prev_preedit->width && eq_width > 0) {
    if (g_opt.no_report_cursor) {
      put_move_cur(prev_preedit->cursor, preedit->cursor);
    } else {
      goto_char(preedit->cursor);
    }
    return;
  }

  if (!g_opt.no_report_cursor) {
    set_line2width(preedit);
  }

  /* ���Ϥ�����֤˰�ư */
  if (g_opt.no_report_cursor) {
    put_move_cur(prev_preedit->cursor, eq_width);
  } else {
    goto_col(eq_width);
  }

  /* �ΰ褬�Ѥ�äƤ��ʤ��Τ��ѹ���ʬ������� */
  if ((g_opt.no_report_cursor && preedit->width == prev_preedit->width) || (!g_opt.no_report_cursor && is_eq_region())) {
    int eq_width_rev = compare_preedit_rev(preedit, prev_preedit);
    debug2(("eq_width_rev = %d\n", eq_width_rev));
    draw_subpreedit(preedit, eq_width, preedit->width - eq_width_rev);
    if (g_opt.no_report_cursor) {
      put_move_cur(preedit->width - eq_width_rev, preedit->cursor);
    } else {
      goto_char(preedit->cursor);
    }
    return;
  }

  if (g_opt.no_report_cursor && g_opt.on_the_spot && preedit->width > prev_preedit->width) {
    put_insert(preedit->width - prev_preedit->width);
  }
  draw_subpreedit(preedit, eq_width, preedit->width);

  if (g_opt.no_report_cursor) {
    if (preedit->width > prev_preedit->width) {
      put_cursor_left(preedit->width - preedit->cursor);
    } else {
      if (g_opt.on_the_spot) {
        put_delete(prev_preedit->width - preedit->width);
        put_cursor_left(preedit->width - preedit->cursor);
      } else {
        put_erase(prev_preedit->width - preedit->width);
        put_cursor_left(prev_preedit->width - preedit->cursor);
      }
    }
  } else {
    erase_prev_preedit();
    /* ��������ΰ��֤˰�ư */
    goto_char(preedit->cursor);
  }

}

static int is_eq_region(void)
{
  int lineno;
  if (s_preedit_lines != s_prev_preedit_lines) {
    return FALSE;
  }
  for (lineno = 0; lineno < s_preedit_lines; lineno++) {
    if (s_line2width[lineno] != s_prev_line2width[lineno]) {
      return FALSE;
    }
  }
  return TRUE;
}

/*
 * p����start�μ���ʸ��������end��ʸ���ޤǽ��Ϥ��롣
 */
static void draw_subpreedit(struct preedit_tag *p, int start, int end)
{
  int i = 0;
  int w = 0;
  int byte_offset = 0;
  int width = end - start;
  int save_i;

  if (width <= 0 || p->width <= start) {
    return;
  }

  /* start���ɤ�����Ĵ�٤� */
  if (start != 0) {
    for (i = 0; i < p->nr_psegs; i++) {
      char *seg_str = p->pseg[i].str;
      int seg_w = strwidth(seg_str);
      if (w + seg_w == start) {
        i++;
        break;
      } else if (w + seg_w > start) {
        byte_offset = (width2byte(seg_str, start - w))[0];
        break;
      }
      w += seg_w;
    }
  }

  assert(i < p->nr_psegs);

  w = 0;

  save_i = i;
  p->pseg[save_i].str += byte_offset;
  for (; i < p->nr_psegs; i++) {
    char *seg_str = p->pseg[i].str;
    int seg_w = strwidth(seg_str);
    if (w + seg_w <= width) {
      if (g_opt.no_report_cursor) {
        put_uim_str(seg_str, p->pseg[i].attr);
      } else {
        draw_pseg(&(p->pseg[i]), start + w);
      }
      w += seg_w;
      if (w == width) {
        break;
      }
    } else {
      int *byte_width = width2byte(seg_str, width - w);
      int byte = byte_width[0];
      int save_char = seg_str[byte];
      seg_str[byte] = '\0';
      if (g_opt.no_report_cursor) {
        put_uim_str(seg_str, p->pseg[i].attr);
      } else {
        draw_pseg(&(p->pseg[i]), start + w);
      }
      seg_str[byte] = save_char;
      w += byte_width[1];
      break;
    }
  }
  p->pseg[save_i].str -= byte_offset;
}

/*
 * pseg�����褹��
 * ��start_width�μ���ʸ����pseg����Ƭʸ��
 */
static void draw_pseg(struct preedit_segment_tag *pseg, int start_width)
{
  struct point_tag start_point = width2point_col(start_width);
  int margin = g_win->ws_col - start_point.col;
  int lineno = start_point.row - s_head.row;
  char *seg_str = pseg->str;
  int seg_w = strwidth(seg_str);

  assert(margin >= 0 && margin <= g_win->ws_col);

  while (TRUE) {
    int *byte_width;
    int byte;
    int width;

    if (g_opt.on_the_spot && s_line2width[lineno] > s_prev_line2width[lineno]) {
      int margin2 = margin - g_win->ws_col - s_prev_line2width[lineno];
      if (seg_w >= margin2) {
        byte_width = width2byte(seg_str, margin2);
        byte = byte_width[0];
        width = byte_width[1];
        put_uim_str_len(seg_str, pseg->attr, byte);
        if (width < margin2) {
          put_cursor_address(s_head.row + lineno, s_prev_line2width[lineno]);
          put_insert(s_line2width[lineno] - s_prev_line2width[lineno]);
          put_cursor_address(s_head.row + lineno, s_prev_line2width[lineno] - (margin2 - width));
        } else {
          put_insert(s_line2width[lineno] - s_prev_line2width[lineno]);
        }
        seg_str += byte;
        margin -= width;
        seg_w -= width;
        s_prev_line2width[lineno] = s_line2width[lineno];
      }
    }

    /* �ޤ��֤�ɬ�פ��ʤ��� */
    if (seg_w < margin) {
      put_uim_str(seg_str, pseg->attr);
      break;
    }

    byte_width = width2byte(seg_str, margin);
    byte = byte_width[0];
    width = byte_width[1];

    /* �����ޤǽ��� */
    put_uim_str_len(seg_str, pseg->attr, byte);

    /* ��ü��ʸ����ä�ɬ�פ����뤫 */
    if (s_line2width[lineno] < s_prev_line2width[lineno]) {
      if (g_opt.on_the_spot) {
        put_delete(s_prev_line2width[lineno] - s_line2width[lineno]);
      } else {
        put_erase(s_prev_line2width[lineno] - s_line2width[lineno]);
      }
      s_prev_line2width[lineno] = s_line2width[lineno];
    }

    /* �ץꥨ�ǥ��åȤ�ü���α�������Ф�Ȥ��ϥ������뤹�� */
    if (s_head.row + lineno == g_win->ws_row - 1 && s_head.row > 0) {
      put_crlf();
      s_head.row--;
    } else {
      put_cursor_address(s_head.row + lineno + 1, 0);
    }

    seg_str += byte;
    seg_w -= width;
    margin = g_win->ws_col;
    lineno++;
  }
}

/*
 * p1��p2����Ƭ����ζ�����ʬʸ����(°����������)�������֤�
 */
static int compare_preedit(struct preedit_tag *p1, struct preedit_tag *p2)
{
  int i;
  int eq_width = 0;

  for (i = 0; i < min(p1->nr_psegs, p2->nr_psegs); i++) {
    struct preedit_segment_tag *pseg1 = &(p1->pseg[i]);
    struct preedit_segment_tag *pseg2 = &(p2->pseg[i]);
    if (pseg1->attr == pseg2->attr) {
      if (strcmp(pseg1->str, pseg2->str) == 0) {
        eq_width += strwidth(pseg1->str);
      } else {
        eq_width += compare_str(pseg1->str, pseg2->str);
        break;
      }
    } else {
      break;
    }
  }
  return eq_width;
}

/*
 * p1��p2����������ζ�����ʬʸ����(°����������)�������֤�
 */
static int compare_preedit_rev(struct preedit_tag *p1, struct preedit_tag *p2)
{
  int i;
  int eq_width_rev = 0;

  for (i = 1; i <= min(p1->nr_psegs, p2->nr_psegs); i++) {
    struct preedit_segment_tag *pseg1 = &(p1->pseg[p1->nr_psegs - i]);
    struct preedit_segment_tag *pseg2 = &(p2->pseg[p2->nr_psegs - i]);
    if (pseg1->attr == pseg2->attr) {
      if (strcmp(pseg1->str, pseg2->str) == 0) {
        eq_width_rev += strwidth(pseg1->str);
      } else {
        eq_width_rev += compare_str_rev(pseg1->str, pseg2->str);
        break;
      }
    } else {
      break;
    }
  }
  return eq_width_rev;
}

static int min(int a, int b)
{
  return a < b ? a : b;
}

static void erase_prev_preedit(void)
{
  int lineno;
  for (lineno = 0; lineno < s_preedit_lines; lineno++) {
    assert(!g_opt.on_the_spot || s_line2width[lineno] <= s_prev_line2width[lineno]);
    if (s_prev_line2width[lineno] > s_line2width[lineno]) {
      put_cursor_address(s_head.row + lineno, s_line2width[lineno]);
      if (g_opt.on_the_spot) {
        put_delete(s_prev_line2width[lineno] - s_line2width[lineno]);
      } else {
        put_erase(s_prev_line2width[lineno] - s_line2width[lineno]);
      }
    }
  }
  for (; lineno < s_prev_preedit_lines; lineno++) {
    if (s_prev_line2width[lineno] > 0) {
      put_cursor_address(s_head.row + lineno, 0);
      if (g_opt.on_the_spot) {
        put_delete(s_prev_line2width[lineno]);
      } else {
        put_erase(s_prev_line2width[lineno]);
      }
    }
  }
}

static void erase_preedit(void)
{
  s_prev_preedit_lines = s_preedit_lines;
  s_preedit_lines = 1;
  free(s_prev_line2width);
  s_prev_line2width = s_line2width;
  s_line2width = uim_malloc(sizeof(int));
  s_line2width[0] = s_head.col;
  erase_prev_preedit();
}

static void set_line2width(struct preedit_tag *preedit)
{
  int i;
  int line_width = s_head.col;
  int lineno = 0;

  free(s_prev_line2width);
  s_prev_line2width = s_line2width;
  s_prev_preedit_lines = s_preedit_lines;
  s_line2width = uim_malloc(sizeof(int));
  s_preedit_lines = 1;

  for (i = 0; i < preedit->nr_psegs; i++) {
    char *seg_str = preedit->pseg[i].str;
    int seg_w = strwidth(seg_str);
    while (line_width + seg_w >= g_win->ws_col) {
      if (lineno + 1 == s_preedit_lines) {
        s_line2width = uim_realloc(s_line2width, sizeof(int) * ++s_preedit_lines);
      }
      if (line_width + seg_w > g_win->ws_col) {
        int *byte_width = width2byte(seg_str, g_win->ws_col - line_width);
        s_line2width[lineno++] = line_width + byte_width[1];
        seg_str += byte_width[0];
        seg_w = strwidth(seg_str);
        debug2(("line = %d col = %d\n", lineno - 1, s_line2width[lineno - 1]));
      } else {
        s_line2width[lineno++] = g_win->ws_col;
        debug2(("line = %d col = %d\n", lineno - 1, s_line2width[lineno - 1]));
        seg_w = 0;
      }
      line_width = 0;
    }
    line_width += seg_w;
  }
  if (s_preedit_lines > s_prev_preedit_lines) {
    int i;
    s_prev_line2width = uim_realloc(s_prev_line2width, sizeof(int) * s_preedit_lines);
    for (i = s_prev_preedit_lines; i < s_preedit_lines; i++) {
      s_prev_line2width[i] = 0;
    }
  }
  s_line2width[lineno] = line_width;
  debug2(("line = %d col = %d\n", lineno, s_line2width[lineno]));
}

/*
 * �ץꥨ�ǥ��åȤ���width�μ���ʸ���˰�ư����
 * goto_char(0) => ��Ƭ��ʸ���˰�ư
 */
static void goto_char(int width)
{
  struct point_tag dest = width2point_char(width);
  assert(width >= 0);
  assert(s_preedit_lines > 0);
  put_cursor_address(dest.row, dest.col);
}

/*
 * �ץꥨ�ǥ��åȤ���width�μ���column�˰�ư
 * goto_col(0) => ��Ƭ�˰�ư
 */
static void goto_col(int width)
{
  struct point_tag dest = width2point_col(width);
  assert(width >= 0);
  assert(s_preedit_lines > 0);
  put_cursor_address(dest.row, dest.col);
}

/*
 * �ץꥨ�ǥ��åȤ���width�μ���ʸ����°�����ֹ���֤�
 * ���ֹ��0����Ϥޤ�
 */
static int width2lineno_char(int width)
{
  int i;
  int w = -s_head.col;
  assert(s_preedit_lines > 0);
  for (i = 0; i < s_preedit_lines - 1; i++) {
    w += s_line2width[i];
    if (width < w) {
      return i;
    }
  }
  return s_preedit_lines - 1;
}

/*
 * �ץꥨ�ǥ��åȤ���width�μ���column��°�����ֹ���֤�
 * ���ֹ��0����Ϥޤ�
 */
static int width2lineno_col(int width)
{
  int i;
  int w =  -s_head.col;
  assert(s_preedit_lines > 0);
  for (i = 0; i < s_preedit_lines - 1; i++) {
    if (width < w + g_win->ws_col) {
      return i;
    }
    w += s_line2width[i];
  }
  return s_preedit_lines - 1;
  /* ü�����������ѹ����줿�Ȥ��Ϥ����ˤ��뤳�Ȥ⤢�� */
  /* assert(s_winch); */
  /* return s_preedit_lines; */
}

/*
 * �ץꥨ�ǥ��åȤ���width�μ���ʸ���ΰ��֤��֤�
 */
static struct point_tag width2point_char(int width)
{
  struct point_tag point;
  int lineno = width2lineno_char(width);
  int col = s_head.col + width;
  int i;
  assert(s_preedit_lines > 0);
  for (i = 0; i < lineno; i++) {
    col -= s_line2width[i];
  }
  point.row = s_head.row + lineno;
  point.col = col;
  return point;
}

/*
 * �ץꥨ�ǥ��åȤ���width�μ���column�ΰ��֤��֤�
 */
static struct point_tag width2point_col(int width)
{
  struct point_tag point;
  int lineno = width2lineno_col(width);
  int col = s_head.col + width;
  int i;
  assert(s_preedit_lines > 0);
  for (i = 0; i < lineno; i++) {
    col -= s_line2width[i];
  }
  point.row = s_head.row + lineno;
  point.col = col;
  return point;
}

/*
 * ü�����������ѹ����줿�Ȥ��˸Ƥ�
 */
void draw_winch(struct winsize *prev_win)
{
  s_winch = TRUE;
  if (g_opt.status_type == LASTLINE) {
    put_save_cursor();
    put_cursor_invisible();
    put_change_scroll_region(0, g_win->ws_row - 1);
    if (g_win->ws_row > prev_win->ws_row) {
      struct winsize save_win = *g_win;
      *g_win = *prev_win;
      clear_lastline();
      *g_win = save_win;
    }
    draw_statusline_force_no_restore();
    put_restore_cursor();
    put_cursor_normal();
  }
}

#if defined(DEBUG) && DEBUG > 2
static void print_preedit(struct preedit_tag *p)
{
  int i;
  debug2((" cursor = %d width = %d ", p->cursor, p->width));
  for (i = 0; i < p->nr_psegs; i++) {
    debug2((" under = %d rev = %d %s\t", p->pseg[i].attr & UPreeditAttr_UnderLine, p->pseg[i].attr & UPreeditAttr_Reverse, p->pseg[i].str));
  }
}
#endif

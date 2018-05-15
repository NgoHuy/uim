scmdir = $(pkgdatadir)

MOSTLYCLEANFILES = $(GENERATED_SCM_FILES)
dist_scm_DATA = $(SCM_FILES)
scm_DATA = $(GENERATED_SCM_FILES)
GENERATED_SCM_FILES = installed-modules.scm loader.scm
SCM_FILES = plugin.scm im.scm im-custom.scm lazy-load.scm init.scm \
 im-switcher.scm \
 default.scm \
 util.scm deprecated-util.scm ichar.scm light-record.scm wlos.scm \
 ustr.scm trec.scm i18n.scm iso-639-1.scm \
 event.scm ng-key.scm ng-action.scm composer.scm \
 key.scm action.scm load-action.scm \
 uim-sh.scm editline.scm custom.scm custom-rt.scm \
 uim-help.scm \
 direct.scm \
 rk.scm \
 generic.scm generic-custom.scm generic-key-custom.scm \
 generic-predict.scm predict-custom.scm \
 viqr.scm \
 xtelex.scm \
 xvni.scm \
 xtelex-ipa.scm \
 xvni-ipa.scm \
 ipa-x-sampa.scm \
 m17nlib.scm m17nlib-custom.scm \
 uim-module-manager.scm \
 fileio.scm socket.scm process.scm \
 openssl.scm \
 sqlite3.scm \
 lolevel.scm \
 input-parse.scm match.scm pregexp.scm \
 packrat.scm \
 json.scm json-parser-expanded.scm \
 http-client.scm http-server.scm \
 sxml-tools.scm sxpathlib.scm \
 annotation.scm annotation-custom.scm annotation-dict.scm \
 annotation-filter.scm \
 dynlib.scm \
 ct.scm \
 dict-socket.scm

OTHER_SCM_FILES = \
 macro-expander.scm macro-expander-chicken.scm \
 json-parser-expander.scm json.scm.in packrat.scm.in

EXTRA_DIST = $(OTHER_SCM_FILES)

ETAGS_ARGS=$(SCM_FILES) $(GENERATED_SCM_FILES)


module_names = "m17nlib" "viqr" "xvni" "xtelex" "ipa-x-sampa" "xtelex-ipa" "xvni-ipa"

UIM_MODULE_MANAGER = $(top_builddir)/uim/uim-module-manager
UIM_MODULE_MANAGER_ENV = \
        LIBUIM_SYSTEM_SCM_FILES=$(abs_top_srcdir)/sigscheme/lib \
        LIBUIM_SCM_FILES=$(abs_srcdir) \
        LIBUIM_PLUGIN_LIB_DIR=$(abs_top_builddir)/uim/.libs \
        UIM_DISABLE_NOTIFY=1

loader.scm: installed-modules.scm

installed-modules.scm: $(SCM_FILES)
	$(MAKE) $(AM_MAKEFLAGS) -C $(top_builddir)/uim uim-module-manager && \
	$(UIM_MODULE_MANAGER_ENV) $(UIM_MODULE_MANAGER) \
	    --path $(top_builddir)/scm --register $(module_names)

json-parser-expanded.scm: macro-expander.scm json-parser-expander.scm packrat.scm.in
	if test -n "$(CSI)"; then \
	    $(CSI) -R syntax-case -q json-parser-expander.scm > json-parser-expanded.scm; \
	fi

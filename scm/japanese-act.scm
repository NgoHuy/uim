;;;
;;; Copyright (c) 2010-2013 uim Project https://github.com/uim/uim
;;;
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;; 1. Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;; 2. Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;; 3. Neither the name of authors nor the names of its contributors
;;;    may be used to endorse or promote products derived from this software
;;;    without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
;;; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
;;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
;;; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
;;; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;;; SUCH DAMAGE.
;;;;

;; Japanese EUC
(define ja-act-rule-basic
  '( 

((("a"). ())("あ" "ア" "ｱ"))
((("b" "a"). ())("ば" "バ" "ﾊﾞ"))
((("b" "e"). ())("べ" "ベ" "ﾍﾞ"))
((("b" "i"). ())("び" "ビ" "ﾋﾞ"))
((("b" "o"). ())("ぼ" "ボ" "ﾎﾞ"))
((("b" "u"). ())("ぶ" "ブ" "ﾌﾞ"))
((("d" "a"). ())("だ" "ダ" "ﾀﾞ"))
((("d" "e"). ())("で" "デ" "ﾃﾞ"))
((("d" "i"). ())("ぢ" "ヂ" "ﾁﾞ"))
((("d" "o"). ())("ど" "ド" "ﾄﾞ"))
((("d" "u"). ())("づ" "ヅ" "ﾂﾞ"))
((("e"). ())("え" "エ" "ｴ"))
((("f" "a"). ())(("ふ" "フ" "ﾌ") ("ぁ" "ァ" "ｧ")))
((("f" "e"). ())(("ふ" "フ" "ﾌ") ("ぇ" "ェ" "ｪ")))
((("f" "i"). ())(("ふ" "フ" "ﾌ") ("ぃ" "ィ" "ｨ")))
((("f" "o"). ())(("ふ" "フ" "ﾌ") ("ぉ" "ォ" "ｫ")))
((("f" "u"). ())("ふ" "フ" "ﾌ"))
((("g" "a"). ())("が" "ガ" "ｶﾞ"))
((("g" "e"). ())("げ" "ゲ" "ｹﾞ"))
((("g" "i"). ())("ぎ" "ギ" "ｷﾞ"))
((("g" "o"). ())("ご" "ゴ" "ｺﾞ"))
((("g" "u"). ())("ぐ" "グ" "ｸﾞ"))
((("h" "a"). ())("は" "ハ" "ﾊ"))
((("h" "e"). ())("へ" "ヘ" "ﾍ"))
((("h" "i"). ())("ひ" "ヒ" "ﾋ"))
((("h" "o"). ())("ほ" "ホ" "ﾎ"))
((("h" "u"). ())("ふ" "フ" "ﾌ"))
((("i"). ())("い" "イ" "ｲ"))
((("m" "a"). ())("ま" "マ" "ﾏ"))
((("m" "e"). ())("め" "メ" "ﾒ"))
((("m" "i"). ())("み" "ミ" "ﾐ"))
((("m" "o"). ())("も" "モ" "ﾓ"))
((("m" "u"). ())("む" "ム" "ﾑ"))
((("n"). ())("ん" "ン" "ﾝ"))
((("n" "a"). ())("な" "ナ" "ﾅ"))
((("n" "e"). ())("ね" "ネ" "ﾈ"))
((("n" "i"). ())("に" "ニ" "ﾆ"))
((("n" "n"). ())("ん" "ン" "ﾝ"))
((("n" "o"). ())("の" "ノ" "ﾉ"))
((("n" "u"). ())("ぬ" "ヌ" "ﾇ"))
((("o"). ())("お" "オ" "ｵ"))
((("p" "a"). ())("ぱ" "パ" "ﾊﾟ"))
((("p" "e"). ())("ぺ" "ペ" "ﾍﾟ"))
((("p" "i"). ())("ぴ" "ピ" "ﾋﾟ"))
((("p" "o"). ())("ぽ" "ポ" "ﾎﾟ"))
((("p" "u"). ())("ぷ" "プ" "ﾌﾟ"))
((("r" "a"). ())("ら" "ラ" "ﾗ"))
((("r" "e"). ())("れ" "レ" "ﾚ"))
((("r" "i"). ())("り" "リ" "ﾘ"))
((("r" "o"). ())("ろ" "ロ" "ﾛ"))
((("r" "u"). ())("る" "ル" "ﾙ"))
((("s" "a"). ())("さ" "サ" "ｻ"))
((("s" "e"). ())("せ" "セ" "ｾ"))
((("s" "h" "a"). ())(("し" "シ" "ｼ") ("ゃ" "ャ" "ｬ")))
((("s" "h" "e"). ())(("し" "シ" "ｼ") ("ぇ" "ェ" "ｪ")))
((("s" "h" "i"). ())("し" "シ" "ｼ"))
((("s" "h" "o"). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ")))
((("s" "h" "u"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ")))
((("s" "i"). ())("し" "シ" "ｼ"))
((("s" "o"). ())("そ" "ソ" "ｿ"))
((("s" "u"). ())("す" "ス" "ｽ"))
((("t" "a"). ())("た" "タ" "ﾀ"))
((("t" "e"). ())("て" "テ" "ﾃ"))
((("t" "i"). ())("ち" "チ" "ﾁ"))
((("t" "o"). ())("と" "ト" "ﾄ"))
((("t" "u"). ())("つ" "ツ" "ﾂ"))
((("u"). ())("う" "ウ" "ｳ"))
((("v" "a"). ())(("う゛" "ヴ" "ｳﾞ") ("ぁ" "ァ" "ｧ")))
((("v" "e"). ())(("う゛" "ヴ" "ｳﾞ") ("ぇ" "ェ" "ｪ")))
((("v" "i"). ())(("う゛" "ヴ" "ｳﾞ") ("ぃ" "ィ" "ｨ")))
((("v" "o"). ())(("う゛" "ヴ" "ｳﾞ") ("ぉ" "ォ" "ｫ")))
((("v" "u"). ())("う゛" "ヴ" "ｳﾞ"))
((("w" "a"). ())("わ" "ワ" "ﾜ"))
((("w" "e"). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ")))
((("w" "i"). ())(("う" "ウ" "ｳ") ("ぃ" "ィ" "ｨ")))
((("w" "o"). ())("を" "ヲ" "ｦ"))
((("w" "u"). ())("う" "ウ" "ｳ"))
((("y" "a"). ())("や" "ヤ" "ﾔ"))
((("y" "e"). ())(("い" "イ" "ｲ") ("ぇ" "ェ" "ｪ")))
((("y" "o"). ())("よ" "ヨ" "ﾖ"))
((("y" "u"). ())("ゆ" "ユ" "ﾕ"))
((("z" "a"). ())("ざ" "ザ" "ｻﾞ"))
((("z" "e"). ())("ぜ" "ゼ" "ｾﾞ"))
((("z" "i"). ())("じ" "ジ" "ｼﾞ"))
((("z" "o"). ())("ぞ" "ゾ" "ｿﾞ"))
((("z" "u"). ())("ず" "ズ" "ｽﾞ"))
((("'"). ())("っ" "ッ" "ｯ"))
((("`" "a"). ())("ぁ" "ァ" "ｧ"))
((("`" "i"). ())("ぃ" "ィ" "ｨ"))
((("`" "u"). ())("ぅ" "ゥ" "ｩ"))
((("`" "e"). ())("ぇ" "ェ" "ｪ"))
((("`" "o"). ())("ぉ" "ォ" "ｫ"))
((("`" "c" "a"). ())("か" "ヵ" "ｶ"))
((("`" "c" "e"). ())("け" "ヶ" "ｹ"))
((("`" "w" "a"). ())("ゎ" "ヮ" "ﾜ"))
((("`" "w" "e"). ())("ゑ" "ヱ" "ｴ"))
((("`" "w" "i"). ())("ゐ" "ヰ" "ｲ"))
((("`" "y" "a"). ())("ゃ" "ャ" "ｬ"))
((("`" "y" "o"). ())("ょ" "ョ" "ｮ"))
((("`" "y" "u"). ())("ゅ" "ュ" "ｭ"))
((("`" "y" "s"). ())("ゃ" "ャ" "ｬ"))
((("`" "y" "n"). ())("ょ" "ョ" "ｮ"))
((("`" "y" "h"). ())("ゅ" "ュ" "ｭ"))
((("c" "a"). ())("か" "カ" "ｶ"))
((("c" "i"). ())("き" "キ" "ｷ"))
((("c" "u"). ())("く" "ク" "ｸ"))
((("c" "e"). ())("け" "ケ" "ｹ"))
((("c" "o"). ())("こ" "コ" "ｺ"))
(((";"). ())(("あ" "ア" "ｱ") ("ん" "ン" "ﾝ")))
((("x"). ())(("い" "イ" "ｲ") ("ん" "ン" "ﾝ")))
((("k"). ())(("う" "ウ" "ｳ") ("ん" "ン" "ﾝ")))
((("j"). ())(("え" "エ" "ｴ") ("ん" "ン" "ﾝ")))
((("q"). ())(("お" "オ" "ｵ") ("ん" "ン" "ﾝ")))
((("c" ";"). ())(("か" "カ" "ｶ") ("ん" "ン" "ﾝ")))
((("c" "x"). ())(("き" "キ" "ｷ") ("ん" "ン" "ﾝ")))
((("c" "k"). ())(("く" "ク" "ｸ") ("ん" "ン" "ﾝ")))
((("c" "j"). ())(("け" "ケ" "ｹ") ("ん" "ン" "ﾝ")))
((("c" "q"). ())(("こ" "コ" "ｺ") ("ん" "ン" "ﾝ")))
((("c" "'"). ())(("か" "カ" "ｶ") ("い" "イ" "ｲ")))
((("c" "p"). ())(("く" "ク" "ｸ") ("う" "ウ" "ｳ")))
((("c" "."). ())(("け" "ケ" "ｹ") ("い" "イ" "ｲ")))
((("c" ","). ())(("こ" "コ" "ｺ") ("う" "ウ" "ｳ")))
((("s" ";"). ())(("さ" "サ" "ｻ") ("ん" "ン" "ﾝ")))
((("s" "x"). ())(("し" "シ" "ｼ") ("ん" "ン" "ﾝ")))
((("s" "k"). ())(("す" "ス" "ｽ") ("ん" "ン" "ﾝ")))
((("s" "j"). ())(("せ" "セ" "ｾ") ("ん" "ン" "ﾝ")))
((("s" "q"). ())(("そ" "ソ" "ｿ") ("ん" "ン" "ﾝ")))
((("s" "'"). ())(("さ" "サ" "ｻ") ("い" "イ" "ｲ")))
((("s" "p"). ())(("す" "ス" "ｽ") ("う" "ウ" "ｳ")))
((("s" "."). ())(("せ" "セ" "ｾ") ("い" "イ" "ｲ")))
((("s" ","). ())(("そ" "ソ" "ｿ") ("う" "ウ" "ｳ")))
((("t" ";"). ())(("た" "タ" "ﾀ") ("ん" "ン" "ﾝ")))
((("t" "x"). ())(("ち" "チ" "ﾁ") ("ん" "ン" "ﾝ")))
((("t" "k"). ())(("つ" "ツ" "ﾂ") ("ん" "ン" "ﾝ")))
((("t" "j"). ())(("て" "テ" "ﾃ") ("ん" "ン" "ﾝ")))
((("t" "q"). ())(("と" "ト" "ﾄ") ("ん" "ン" "ﾝ")))
((("t" "'"). ())(("た" "タ" "ﾀ") ("い" "イ" "ｲ")))
((("t" "p"). ())(("つ" "ツ" "ﾂ") ("う" "ウ" "ｳ")))
((("t" "."). ())(("て" "テ" "ﾃ") ("い" "イ" "ｲ")))
((("t" ","). ())(("と" "ト" "ﾄ") ("う" "ウ" "ｳ")))
((("n" ";"). ())(("な" "ナ" "ﾅ") ("ん" "ン" "ﾝ")))
((("n" "x"). ())(("に" "ニ" "ﾆ") ("ん" "ン" "ﾝ")))
((("n" "k"). ())(("ぬ" "ヌ" "ﾇ") ("ん" "ン" "ﾝ")))
((("n" "j"). ())(("ね" "ネ" "ﾈ") ("ん" "ン" "ﾝ")))
((("n" "q"). ())(("の" "ノ" "ﾉ") ("ん" "ン" "ﾝ")))
((("n" "'"). ())(("な" "ナ" "ﾅ") ("い" "イ" "ｲ")))
((("n" "p"). ())(("ぬ" "ヌ" "ﾇ") ("う" "ウ" "ｳ")))
((("n" "."). ())(("ね" "ネ" "ﾈ") ("い" "イ" "ｲ")))
((("n" ","). ())(("の" "ノ" "ﾉ") ("う" "ウ" "ｳ")))
((("h" ";"). ())(("は" "ハ" "ﾊ") ("ん" "ン" "ﾝ")))
((("h" "x"). ())(("ひ" "ヒ" "ﾋ") ("ん" "ン" "ﾝ")))
((("h" "k"). ())(("ふ" "フ" "ﾌ") ("ん" "ン" "ﾝ")))
((("h" "j"). ())(("へ" "ヘ" "ﾍ") ("ん" "ン" "ﾝ")))
((("h" "q"). ())(("ほ" "ホ" "ﾎ") ("ん" "ン" "ﾝ")))
((("h" "'"). ())(("は" "ハ" "ﾊ") ("い" "イ" "ｲ")))
((("h" "p"). ())(("ふ" "フ" "ﾌ") ("う" "ウ" "ｳ")))
((("h" "."). ())(("へ" "ヘ" "ﾍ") ("い" "イ" "ｲ")))
((("h" ","). ())(("ほ" "ホ" "ﾎ") ("う" "ウ" "ｳ")))
((("m" ";"). ())(("ま" "マ" "ﾏ") ("ん" "ン" "ﾝ")))
((("m" "x"). ())(("み" "ミ" "ﾐ") ("ん" "ン" "ﾝ")))
((("m" "k"). ())(("む" "ム" "ﾑ") ("ん" "ン" "ﾝ")))
((("m" "j"). ())(("め" "メ" "ﾒ") ("ん" "ン" "ﾝ")))
((("m" "q"). ())(("も" "モ" "ﾓ") ("ん" "ン" "ﾝ")))
((("m" "'"). ())(("ま" "マ" "ﾏ") ("い" "イ" "ｲ")))
((("m" "p"). ())(("む" "ム" "ﾑ") ("う" "ウ" "ｳ")))
((("m" "."). ())(("め" "メ" "ﾒ") ("い" "イ" "ｲ")))
((("m" ","). ())(("も" "モ" "ﾓ") ("う" "ウ" "ｳ")))
((("y" ";"). ())(("や" "ヤ" "ﾔ") ("ん" "ン" "ﾝ")))
((("y" "k"). ())(("ゆ" "ユ" "ﾕ") ("ん" "ン" "ﾝ")))
((("y" "q"). ())(("よ" "ヨ" "ﾖ") ("ん" "ン" "ﾝ")))
((("y" "'"). ())(("や" "ヤ" "ﾔ") ("い" "イ" "ｲ")))
((("y" "p"). ())(("ゆ" "ユ" "ﾕ") ("う" "ウ" "ｳ")))
((("y" "."). ())(("い" "イ" "ｲ") ("う" "ウ" "ｳ")))
((("y" ","). ())(("よ" "ヨ" "ﾖ") ("う" "ウ" "ｳ")))
((("r" ";"). ())(("ら" "ラ" "ﾗ") ("ん" "ン" "ﾝ")))
((("r" "x"). ())(("り" "リ" "ﾘ") ("ん" "ン" "ﾝ")))
((("r" "k"). ())(("る" "ル" "ﾙ") ("ん" "ン" "ﾝ")))
((("r" "j"). ())(("れ" "レ" "ﾚ") ("ん" "ン" "ﾝ")))
((("r" "q"). ())(("ろ" "ロ" "ﾛ") ("ん" "ン" "ﾝ")))
((("r" "'"). ())(("ら" "ラ" "ﾗ") ("い" "イ" "ｲ")))
((("r" "p"). ())(("る" "ル" "ﾙ") ("う" "ウ" "ｳ")))
((("r" "."). ())(("れ" "レ" "ﾚ") ("い" "イ" "ｲ")))
((("r" ","). ())(("ろ" "ロ" "ﾛ") ("う" "ウ" "ｳ")))
((("w" ";"). ())(("わ" "ワ" "ﾜ") ("ん" "ン" "ﾝ")))
((("w" "x"). ())(("う" "ウ" "ｳ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("w" "k"). ())(("う" "ウ" "ｳ") ("ん" "ン" "ﾝ")))
((("w" "j"). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("w" "q"). ())(("う" "ウ" "ｳ") ("ぉ" "ォ" "ｫ") ("ん" "ン" "ﾝ")))
((("w" "'"). ())(("わ" "ワ" "ﾜ") ("い" "イ" "ｲ")))
((("w" "p"). ())(("う" "ウ" "ｳ") ("ぅ" "ゥ" "ｩ")))
((("w" "."). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("w" ","). ())(("う" "ウ" "ｳ") ("ぉ" "ォ" "ｫ") ("ー" "ー" "ｰ")))
((("g" ";"). ())(("が" "ガ" "ｶﾞ") ("ん" "ン" "ﾝ")))
((("g" "x"). ())(("ぎ" "ギ" "ｷﾞ") ("ん" "ン" "ﾝ")))
((("g" "k"). ())(("ぐ" "グ" "ｸﾞ") ("ん" "ン" "ﾝ")))
((("g" "j"). ())(("げ" "ゲ" "ｹﾞ") ("ん" "ン" "ﾝ")))
((("g" "q"). ())(("ご" "ゴ" "ｺﾞ") ("ん" "ン" "ﾝ")))
((("g" "'"). ())(("が" "ガ" "ｶﾞ") ("い" "イ" "ｲ")))
((("g" "p"). ())(("ぐ" "グ" "ｸﾞ") ("う" "ウ" "ｳ")))
((("g" "."). ())(("げ" "ゲ" "ｹﾞ") ("い" "イ" "ｲ")))
((("g" ","). ())(("ご" "ゴ" "ｺﾞ") ("う" "ウ" "ｳ")))
((("z" ";"). ())(("ざ" "ザ" "ｻﾞ") ("ん" "ン" "ﾝ")))
((("z" "x"). ())(("じ" "ジ" "ｼﾞ") ("ん" "ン" "ﾝ")))
((("z" "k"). ())(("ず" "ズ" "ｽﾞ") ("ん" "ン" "ﾝ")))
((("z" "j"). ())(("ぜ" "ゼ" "ｾﾞ") ("ん" "ン" "ﾝ")))
((("z" "q"). ())(("ぞ" "ゾ" "ｿﾞ") ("ん" "ン" "ﾝ")))
((("z" "'"). ())(("ざ" "ザ" "ｻﾞ") ("い" "イ" "ｲ")))
((("z" "p"). ())(("ず" "ズ" "ｽﾞ") ("う" "ウ" "ｳ")))
((("z" "."). ())(("ぜ" "ゼ" "ｾﾞ") ("い" "イ" "ｲ")))
((("z" ","). ())(("ぞ" "ゾ" "ｿﾞ") ("う" "ウ" "ｳ")))
((("d" ";"). ())(("だ" "ダ" "ﾀﾞ") ("ん" "ン" "ﾝ")))
((("d" "x"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ん" "ン" "ﾝ")))
((("d" "k"). ())(("づ" "ヅ" "ﾂﾞ") ("ん" "ン" "ﾝ")))
((("d" "j"). ())(("で" "デ" "ﾃﾞ") ("ん" "ン" "ﾝ")))
((("d" "q"). ())(("ど" "ド" "ﾄﾞ") ("ん" "ン" "ﾝ")))
((("d" "'"). ())(("だ" "ダ" "ﾀﾞ") ("い" "イ" "ｲ")))
((("d" "p"). ())(("づ" "ヅ" "ﾂﾞ") ("う" "ウ" "ｳ")))
((("d" "."). ())(("で" "デ" "ﾃﾞ") ("い" "イ" "ｲ")))
((("d" ","). ())(("ど" "ド" "ﾄﾞ") ("う" "ウ" "ｳ")))
((("b" ";"). ())(("ば" "バ" "ﾊﾞ") ("ん" "ン" "ﾝ")))
((("b" "x"). ())(("び" "ビ" "ﾋﾞ") ("ん" "ン" "ﾝ")))
((("b" "k"). ())(("ぶ" "ブ" "ﾌﾞ") ("ん" "ン" "ﾝ")))
((("b" "j"). ())(("べ" "ベ" "ﾍﾞ") ("ん" "ン" "ﾝ")))
((("b" "q"). ())(("ぼ" "ボ" "ﾎﾞ") ("ん" "ン" "ﾝ")))
((("b" "'"). ())(("ば" "バ" "ﾊﾞ") ("い" "イ" "ｲ")))
((("b" "p"). ())(("ぶ" "ブ" "ﾌﾞ") ("う" "ウ" "ｳ")))
((("b" "."). ())(("べ" "ベ" "ﾍﾞ") ("い" "イ" "ｲ")))
((("b" ","). ())(("ぼ" "ボ" "ﾎﾞ") ("う" "ウ" "ｳ")))
((("p" ";"). ())(("ぱ" "パ" "ﾊﾟ") ("ん" "ン" "ﾝ")))
((("p" "x"). ())(("ぴ" "ピ" "ﾋﾟ") ("ん" "ン" "ﾝ")))
((("p" "k"). ())(("ぷ" "プ" "ﾌﾟ") ("ん" "ン" "ﾝ")))
((("p" "j"). ())(("ぺ" "ペ" "ﾍﾟ") ("ん" "ン" "ﾝ")))
((("p" "q"). ())(("ぽ" "ポ" "ﾎﾟ") ("ん" "ン" "ﾝ")))
((("p" "'"). ())(("ぱ" "パ" "ﾊﾟ") ("い" "イ" "ｲ")))
((("p" "p"). ())(("ぷ" "プ" "ﾌﾟ") ("う" "ウ" "ｳ")))
((("p" "."). ())(("ぺ" "ペ" "ﾍﾟ") ("い" "イ" "ｲ")))
((("p" ","). ())(("ぽ" "ポ" "ﾎﾟ") ("う" "ウ" "ｳ")))
((("c" "g" "a"). ())(("き" "キ" "ｷ") ("ゃ" "ャ" "ｬ")))
((("c" "g" "i"). ())(("き" "キ" "ｷ") ("ぃ" "ィ" "ｨ")))
((("c" "g" "u"). ())(("き" "キ" "ｷ") ("ゅ" "ュ" "ｭ")))
((("c" "g" "e"). ())(("き" "キ" "ｷ") ("ぇ" "ェ" "ｪ")))
((("c" "g" "o"). ())(("き" "キ" "ｷ") ("ょ" "ョ" "ｮ")))
((("c" "g" ";"). ())(("き" "キ" "ｷ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("c" "g" "x"). ())(("き" "キ" "ｷ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("c" "g" "k"). ())(("き" "キ" "ｷ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("c" "g" "j"). ())(("き" "キ" "ｷ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("c" "g" "q"). ())(("き" "キ" "ｷ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("c" "g" "'"). ())(("き" "キ" "ｷ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("c" "g" "p"). ())(("き" "キ" "ｷ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("c" "g" "."). ())(("き" "キ" "ｷ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("c" "g" ","). ())(("き" "キ" "ｷ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("s" "h" "a"). ())(("し" "シ" "ｼ") ("ゃ" "ャ" "ｬ")))
((("s" "h" "i"). ())(("し" "シ" "ｼ") ("ぃ" "ィ" "ｨ")))
((("s" "h" "u"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ")))
((("s" "h" "e"). ())(("し" "シ" "ｼ") ("ぇ" "ェ" "ｪ")))
((("s" "h" "o"). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ")))
((("s" "h" ";"). ())(("し" "シ" "ｼ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("s" "h" "x"). ())(("し" "シ" "ｼ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("s" "h" "k"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("s" "h" "j"). ())(("し" "シ" "ｼ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("s" "h" "q"). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("s" "h" "'"). ())(("し" "シ" "ｼ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("s" "h" "p"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("s" "h" "."). ())(("し" "シ" "ｼ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("s" "h" ","). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("t" "h" "a"). ())(("ち" "チ" "ﾁ") ("ゃ" "ャ" "ｬ")))
((("t" "h" "i"). ())(("ち" "チ" "ﾁ") ("ぃ" "ィ" "ｨ")))
((("t" "h" "u"). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ")))
((("t" "h" "e"). ())(("ち" "チ" "ﾁ") ("ぇ" "ェ" "ｪ")))
((("t" "h" "o"). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ")))
((("t" "h" ";"). ())(("ち" "チ" "ﾁ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("t" "h" "x"). ())(("ち" "チ" "ﾁ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("t" "h" "k"). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("t" "h" "j"). ())(("ち" "チ" "ﾁ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("t" "h" "q"). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("t" "h" "'"). ())(("ち" "チ" "ﾁ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("t" "h" "p"). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("t" "h" "."). ())(("ち" "チ" "ﾁ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("t" "h" ","). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("n" "h" "a"). ())(("に" "ニ" "ﾆ") ("ゃ" "ャ" "ｬ")))
((("n" "h" "i"). ())(("に" "ニ" "ﾆ") ("ぃ" "ィ" "ｨ")))
((("n" "h" "u"). ())(("に" "ニ" "ﾆ") ("ゅ" "ュ" "ｭ")))
((("n" "h" "e"). ())(("に" "ニ" "ﾆ") ("ぇ" "ェ" "ｪ")))
((("n" "h" "o"). ())(("に" "ニ" "ﾆ") ("ょ" "ョ" "ｮ")))
((("n" "h" ";"). ())(("に" "ニ" "ﾆ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("n" "h" "x"). ())(("に" "ニ" "ﾆ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("n" "h" "k"). ())(("に" "ニ" "ﾆ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("n" "h" "j"). ())(("に" "ニ" "ﾆ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("n" "h" "q"). ())(("に" "ニ" "ﾆ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("n" "h" "'"). ())(("に" "ニ" "ﾆ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("n" "h" "p"). ())(("に" "ニ" "ﾆ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("n" "h" "."). ())(("に" "ニ" "ﾆ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("n" "h" ","). ())(("に" "ニ" "ﾆ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("h" "n" "a"). ())(("ひ" "ヒ" "ﾋ") ("ゃ" "ャ" "ｬ")))
((("h" "n" "i"). ())(("ひ" "ヒ" "ﾋ") ("ぃ" "ィ" "ｨ")))
((("h" "n" "u"). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ")))
((("h" "n" "e"). ())(("ひ" "ヒ" "ﾋ") ("ぇ" "ェ" "ｪ")))
((("h" "n" "o"). ())(("ひ" "ヒ" "ﾋ") ("ょ" "ョ" "ｮ")))
((("h" "n" ";"). ())(("ひ" "ヒ" "ﾋ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("h" "n" "x"). ())(("ひ" "ヒ" "ﾋ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("h" "n" "k"). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("h" "n" "j"). ())(("ひ" "ヒ" "ﾋ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("h" "n" "q"). ())(("ひ" "ヒ" "ﾋ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("h" "n" "'"). ())(("ひ" "ヒ" "ﾋ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("h" "n" "p"). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("h" "n" "."). ())(("ひ" "ヒ" "ﾋ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("h" "n" ","). ())(("ひ" "ヒ" "ﾋ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("m" "v" "a"). ())(("み" "ミ" "ﾐ") ("ゃ" "ャ" "ｬ")))
((("m" "v" "i"). ())(("み" "ミ" "ﾐ") ("ぃ" "ィ" "ｨ")))
((("m" "v" "u"). ())(("み" "ミ" "ﾐ") ("ゅ" "ュ" "ｭ")))
((("m" "v" "e"). ())(("み" "ミ" "ﾐ") ("ぇ" "ェ" "ｪ")))
((("m" "v" "o"). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ")))
((("m" "v" ";"). ())(("み" "ミ" "ﾐ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("m" "v" "x"). ())(("み" "ミ" "ﾐ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("m" "v" "k"). ())(("み" "ミ" "ﾐ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("m" "v" "j"). ())(("み" "ミ" "ﾐ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("m" "v" "q"). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("m" "v" "'"). ())(("み" "ミ" "ﾐ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("m" "v" "p"). ())(("み" "ミ" "ﾐ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("m" "v" "."). ())(("み" "ミ" "ﾐ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("m" "v" ","). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("r" "g" "a"). ())(("り" "リ" "ﾘ") ("ゃ" "ャ" "ｬ")))
((("r" "g" "i"). ())(("り" "リ" "ﾘ") ("ぃ" "ィ" "ｨ")))
((("r" "g" "u"). ())(("り" "リ" "ﾘ") ("ゅ" "ュ" "ｭ")))
((("r" "g" "e"). ())(("り" "リ" "ﾘ") ("ぇ" "ェ" "ｪ")))
((("r" "g" "o"). ())(("り" "リ" "ﾘ") ("ょ" "ョ" "ｮ")))
((("r" "g" ";"). ())(("り" "リ" "ﾘ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("r" "g" "x"). ())(("り" "リ" "ﾘ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("r" "g" "k"). ())(("り" "リ" "ﾘ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("r" "g" "j"). ())(("り" "リ" "ﾘ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("r" "g" "q"). ())(("り" "リ" "ﾘ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("r" "g" "'"). ())(("り" "リ" "ﾘ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("r" "g" "p"). ())(("り" "リ" "ﾘ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("r" "g" "."). ())(("り" "リ" "ﾘ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("r" "g" ","). ())(("り" "リ" "ﾘ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("g" "r" "a"). ())(("ぎ" "ギ" "ｷﾞ") ("ゃ" "ャ" "ｬ")))
((("g" "r" "i"). ())(("ぎ" "ギ" "ｷﾞ") ("ぃ" "ィ" "ｨ")))
((("g" "r" "u"). ())(("ぎ" "ギ" "ｷﾞ") ("ゅ" "ュ" "ｭ")))
((("g" "r" "e"). ())(("ぎ" "ギ" "ｷﾞ") ("ぇ" "ェ" "ｪ")))
((("g" "r" "o"). ())(("ぎ" "ギ" "ｷﾞ") ("ょ" "ョ" "ｮ")))
((("g" "r" ";"). ())(("ぎ" "ギ" "ｷﾞ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("g" "r" "x"). ())(("ぎ" "ギ" "ｷﾞ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("g" "r" "k"). ())(("ぎ" "ギ" "ｷﾞ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("g" "r" "j"). ())(("ぎ" "ギ" "ｷﾞ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("g" "r" "q"). ())(("ぎ" "ギ" "ｷﾞ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("g" "r" "'"). ())(("ぎ" "ギ" "ｷﾞ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("g" "r" "p"). ())(("ぎ" "ギ" "ｷﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("g" "r" "."). ())(("ぎ" "ギ" "ｷﾞ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("g" "r" ","). ())(("ぎ" "ギ" "ｷﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("z" "m" "a"). ())(("じ" "ジ" "ｼﾞ") ("ゃ" "ャ" "ｬ")))
((("z" "m" "i"). ())(("じ" "ジ" "ｼﾞ") ("ぃ" "ィ" "ｨ")))
((("z" "m" "u"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ")))
((("z" "m" "e"). ())(("じ" "ジ" "ｼﾞ") ("ぇ" "ェ" "ｪ")))
((("z" "m" "o"). ())(("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ")))
((("z" "m" ";"). ())(("じ" "ジ" "ｼﾞ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("z" "m" "x"). ())(("じ" "ジ" "ｼﾞ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("z" "m" "k"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("z" "m" "j"). ())(("じ" "ジ" "ｼﾞ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("z" "m" "q"). ())(("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("z" "m" "'"). ())(("じ" "ジ" "ｼﾞ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("z" "m" "p"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("z" "m" "."). ())(("じ" "ジ" "ｼﾞ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("z" "m" ","). ())(("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("d" "n" "a"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゃ" "ャ" "ｬ")))
((("d" "n" "i"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ぃ" "ィ" "ｨ")))
((("d" "n" "u"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゅ" "ュ" "ｭ")))
((("d" "n" "e"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ぇ" "ェ" "ｪ")))
((("d" "n" "o"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ょ" "ョ" "ｮ")))
((("d" "n" ";"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("d" "n" "x"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("d" "n" "k"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("d" "n" "j"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("d" "n" "q"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("d" "n" "'"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("d" "n" "p"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("d" "n" "."). ())(("ぢ" "ヂ" "ﾁﾞ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("d" "n" ","). ())(("ぢ" "ヂ" "ﾁﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("b" "v" "a"). ())(("び" "ビ" "ﾋﾞ") ("ゃ" "ャ" "ｬ")))
((("b" "v" "i"). ())(("び" "ビ" "ﾋﾞ") ("ぃ" "ィ" "ｨ")))
((("b" "v" "u"). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ")))
((("b" "v" "e"). ())(("び" "ビ" "ﾋﾞ") ("ぇ" "ェ" "ｪ")))
((("b" "v" "o"). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ")))
((("b" "v" ";"). ())(("び" "ビ" "ﾋﾞ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("b" "v" "x"). ())(("び" "ビ" "ﾋﾞ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("b" "v" "k"). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("b" "v" "j"). ())(("び" "ビ" "ﾋﾞ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("b" "v" "q"). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("b" "v" "'"). ())(("び" "ビ" "ﾋﾞ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("b" "v" "p"). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("b" "v" "."). ())(("び" "ビ" "ﾋﾞ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("b" "v" ","). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("p" "n" "a"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゃ" "ャ" "ｬ")))
((("p" "n" "i"). ())(("ぴ" "ピ" "ﾋﾟ") ("ぃ" "ィ" "ｨ")))
((("p" "n" "u"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゅ" "ュ" "ｭ")))
((("p" "n" "e"). ())(("ぴ" "ピ" "ﾋﾟ") ("ぇ" "ェ" "ｪ")))
((("p" "n" "o"). ())(("ぴ" "ピ" "ﾋﾟ") ("ょ" "ョ" "ｮ")))
((("p" "n" ";"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("p" "n" "x"). ())(("ぴ" "ピ" "ﾋﾟ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("p" "n" "k"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("p" "n" "j"). ())(("ぴ" "ピ" "ﾋﾟ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("p" "n" "q"). ())(("ぴ" "ピ" "ﾋﾟ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("p" "n" "'"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゃ" "ャ" "ｬ") ("い" "イ" "ｲ")))
((("p" "n" "p"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("p" "n" "."). ())(("ぴ" "ピ" "ﾋﾟ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("p" "n" ","). ())(("ぴ" "ピ" "ﾋﾟ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("f" ";"). ())(("ふ" "フ" "ﾌ") ("ぁ" "ァ" "ｧ") ("ん" "ン" "ﾝ")))
((("f" "x"). ())(("ふ" "フ" "ﾌ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("f" "k"). ())(("ふ" "フ" "ﾌ") ("ん" "ン" "ﾝ")))
((("f" "j"). ())(("ふ" "フ" "ﾌ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("f" "q"). ())(("ふ" "フ" "ﾌ") ("ぉ" "ォ" "ｫ") ("ん" "ン" "ﾝ")))
((("f" "'"). ())(("ふ" "フ" "ﾌ") ("ぁ" "ァ" "ｧ") ("い" "イ" "ｲ")))
((("f" "p"). ())(("ふ" "フ" "ﾌ") ("う" "ウ" "ｳ")))
((("f" "."). ())(("ふ" "フ" "ﾌ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("f" ","). ())(("ふ" "フ" "ﾌ") ("ぉ" "ォ" "ｫ") ("ー" "ー" "ｰ")))
((("v" ";"). ())(("う゛" "ヴ" "ｳﾞ") ("ぁ" "ァ" "ｧ") ("ん" "ン" "ﾝ")))
((("v" "x"). ())(("う゛" "ヴ" "ｳﾞ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("v" "k"). ())(("う゛" "ヴ" "ｳﾞ") ("ん" "ン" "ﾝ")))
((("v" "j"). ())(("う゛" "ヴ" "ｳﾞ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("v" "q"). ())(("う゛" "ヴ" "ｳﾞ") ("ぉ" "ォ" "ｫ") ("ん" "ン" "ﾝ")))
((("v" "'"). ())(("う゛" "ヴ" "ｳﾞ") ("ぁ" "ァ" "ｧ") ("い" "イ" "ｲ")))
((("v" "p"). ())(("う゛" "ヴ" "ｳﾞ") ("ー" "ー" "ｰ")))
((("v" "."). ())(("う゛" "ヴ" "ｳﾞ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("v" ","). ())(("う゛" "ヴ" "ｳﾞ") ("ぉ" "ォ" "ｫ") ("ー" "ー" "ｰ")))
((("p" "c"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("p" "l"). ())(("ぴ" "ピ" "ﾋﾟ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("f" "c"). ())(("ふ" "フ" "ﾌ") ("ゅ" "ュ" "ｭ") ("ー" "ー" "ｰ")))
((("f" "l"). ())(("ふ" "フ" "ﾌ") ("ぉ" "ォ" "ｫ") ("ー" "ー" "ｰ")))
((("g" "c"). ())(("ぎ" "ギ" "ｷﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("g" "l"). ())(("ぎ" "ギ" "ｷﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("c" "c"). ())(("き" "キ" "ｷ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("c" "l"). ())(("き" "キ" "ｷ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("r" "c"). ())(("り" "リ" "ﾘ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("r" "l"). ())(("り" "リ" "ﾘ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("h" "t"). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("h" "s"). ())(("ひ" "ヒ" "ﾋ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("t" "t"). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("t" "s"). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("n" "t"). ())(("に" "ニ" "ﾆ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("n" "s"). ())(("に" "ニ" "ﾆ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("s" "t"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("s" "s"). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("b" "w"). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("b" "z"). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("m" "w"). ())(("み" "ミ" "ﾐ") ("ゅ" "ュ" "ｭ") ("ー" "ー" "ｰ")))
((("m" "z"). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("w" "z"). ())(("う" "ウ" "ｳ") ("ぉ" "ォ" "ｫ") ("ー" "ー" "ｰ")))
((("v" "w"). ())(("う゛" "ヴ" "ｳﾞ") ("ゅ" "ュ" "ｭ") ("ー" "ー" "ｰ")))
((("v" "z"). ())(("う゛" "ヴ" "ｳﾞ") ("ぉ" "ォ" "ｫ") ("ー" "ー" "ｰ")))
((("z" "w"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("z" "z"). ())(("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("g" "r" "r"). ())(("ぎ" "ギ" "ｷﾞ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("g" "r" "l"). ())(("ぎ" "ギ" "ｷﾞ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("c" "g" "r"). ())(("き" "キ" "ｷ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("c" "g" "l"). ())(("き" "キ" "ｷ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("r" "g" "r"). ())(("り" "リ" "ﾘ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("r" "g" "l"). ())(("り" "リ" "ﾘ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("h" "n" "s"). ())(("ひ" "ヒ" "ﾋ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("t" "h" "n"). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("t" "h" "s"). ())(("ち" "チ" "ﾁ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("n" "h" "n"). ())(("に" "ニ" "ﾆ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("n" "h" "s"). ())(("に" "ニ" "ﾆ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("s" "h" "n"). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("s" "h" "s"). ())(("し" "シ" "ｼ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("s" "h" "t"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ") ("つ" "ツ" "ﾂ")))
((("p" "n" "s"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("b" "v" "v"). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("b" "v" "z"). ())(("び" "ビ" "ﾋﾞ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("m" "v" "v"). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("m" "v" "z"). ())(("み" "ミ" "ﾐ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("z" "m" "v"). ())(("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ") ("く" "ク" "ｸ")))
((("z" "m" "z"). ())(("じ" "ジ" "ｼﾞ") ("ゃ" "ャ" "ｬ") ("く" "ク" "ｸ")))
((("z" "m" "w"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("つ" "ツ" "ﾂ")))
((("s" "h" "h"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ") ("く" "ク" "ｸ")))
((("z" "m" "m"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("く" "ク" "ｸ")))
((("y" "h"). ())("ゆ" "ユ" "ﾕ"))
((("y" "g"). ())(("ゆ" "ユ" "ﾕ") ("う" "ウ" "ｳ")))
((("y" "z"). ())(("や" "ヤ" "ﾔ") ("ん" "ン" "ﾝ")))
((("y" "m"). ())(("ゆ" "ユ" "ﾕ") ("ん" "ン" "ﾝ")))
((("y" "v"). ())(("よ" "ヨ" "ﾖ") ("ん" "ン" "ﾝ")))
((("p" "s"). ())("ぱ" "パ" "ﾊﾟ"))
((("p" "d"). ())("ぴ" "ピ" "ﾋﾟ"))
((("p" "h"). ())("ぷ" "プ" "ﾌﾟ"))
((("p" "t"). ())("ぺ" "ペ" "ﾍﾟ"))
((("p" "z"). ())(("ぱ" "パ" "ﾊﾟ") ("ん" "ン" "ﾝ")))
((("p" "b"). ())(("ぴ" "ピ" "ﾋﾟ") ("ん" "ン" "ﾝ")))
((("p" "m"). ())(("ぷ" "プ" "ﾌﾟ") ("ん" "ン" "ﾝ")))
((("p" "w"). ())(("ぺ" "ペ" "ﾍﾟ") ("ん" "ン" "ﾝ")))
((("p" "v"). ())(("ぽ" "ポ" "ﾎﾟ") ("ん" "ン" "ﾝ")))
((("y" "y"). ())(("い" "イ" "ｲ") ("う" "ウ" "ｳ")))
((("y" "f"). ())(("よ" "ヨ" "ﾖ") ("り" "リ" "ﾘ")))
((("y" "c"). ())(("い" "イ" "ｲ") ("う" "ウ" "ｳ")))
((("y" "r"). ())(("よ" "ヨ" "ﾖ") ("る" "ル" "ﾙ")))
((("y" "l"). ())(("や" "ヤ" "ﾔ") ("る" "ル" "ﾙ")))
((("y" "d"). ())(("よ" "ヨ" "ﾖ") ("い" "イ" "ｲ")))
((("y" "t"). ())(("よ" "ヨ" "ﾖ") ("っ" "ッ" "ｯ") ("て" "テ" "ﾃ")))
((("y" "n"). ())(("よ" "ヨ" "ﾖ") ("く" "ク" "ｸ")))
((("y" "s"). ())(("や" "ヤ" "ﾔ") ("く" "ク" "ｸ")))
((("y" "b"). ())(("ゆ" "ユ" "ﾕ") ("び" "ビ" "ﾋﾞ")))
((("y" "w"). ())(("い" "イ" "ｲ") ("わ" "ワ" "ﾜ") ("れ" "レ" "ﾚ")))
((("f" "f"). ())(("ふ" "フ" "ﾌ") ("り" "リ" "ﾘ")))
((("f" "g"). ())(("ふ" "フ" "ﾌ") ("る" "ル" "ﾙ")))
((("f" "r"). ())(("ふ" "フ" "ﾌ") ("る" "ル" "ﾙ")))
((("f" "n"). ())(("ふ" "フ" "ﾌ") ("ぁ" "ァ" "ｧ") ("ん" "ン" "ﾝ")))
((("f" "m"). ())(("ふ" "フ" "ﾌ") ("む" "ム" "ﾑ")))
((("g" "t"). ())(("ご" "ゴ" "ｺﾞ") ("と" "ト" "ﾄ")))
((("g" "n"). ())(("ご" "ゴ" "ｺﾞ") ("く" "ク" "ｸ")))
((("g" "s"). ())(("が" "ガ" "ｶﾞ") ("く" "ク" "ｸ")))
((("c" "r"). ())(("か" "カ" "ｶ") ("ら" "ラ" "ﾗ")))
((("c" "d"). ())(("か" "カ" "ｶ") ("た" "タ" "ﾀ")))
((("c" "t"). ())(("こ" "コ" "ｺ") ("と" "ト" "ﾄ")))
((("c" "b"). ())(("か" "カ" "ｶ") ("ん" "ン" "ﾝ") ("が" "ガ" "ｶﾞ") ("え" "エ" "ｴ")))
((("c" "n"). ())(("こ" "コ" "ｺ") ("く" "ク" "ｸ")))
((("c" "s"). ())(("か" "カ" "ｶ") ("く" "ク" "ｸ")))
((("r" "r"). ())(("ら" "ラ" "ﾗ") ("れ" "レ" "ﾚ")))
((("r" "n"). ())(("ら" "ラ" "ﾗ") ("ん" "ン" "ﾝ")))
((("d" "g"). ())(("だ" "ダ" "ﾀﾞ") ("が" "ガ" "ｶﾞ")))
((("d" "c"). ())(("で" "デ" "ﾃﾞ") ("き" "キ" "ｷ")))
((("d" "r"). ())(("で" "デ" "ﾃﾞ") ("あ" "ア" "ｱ") ("る" "ル" "ﾙ")))
((("d" "l"). ())(("で" "デ" "ﾃﾞ") ("し" "シ" "ｼ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("d" "d"). ())(("の" "ノ" "ﾉ") ("で" "デ" "ﾃﾞ")))
((("d" "t"). ())(("だ" "ダ" "ﾀﾞ") ("ち" "チ" "ﾁ")))
((("d" "s"). ())(("で" "デ" "ﾃﾞ") ("す" "ス" "ｽ")))
((("d" "m"). ())(("で" "デ" "ﾃﾞ") ("も" "モ" "ﾓ")))
((("h" "g"). ())(("ふ" "フ" "ﾌ") ("る" "ル" "ﾙ")))
((("h" "c"). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("h" "r"). ())(("ひ" "ヒ" "ﾋ") ("と" "ト" "ﾄ") ("り" "リ" "ﾘ")))
((("h" "l"). ())(("ひ" "ヒ" "ﾋ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("h" "d"). ())(("ほ" "ホ" "ﾎ") ("ど" "ド" "ﾄﾞ")))
((("h" "h"). ())(("ひ" "ヒ" "ﾋ") ("と" "ト" "ﾄ")))
((("h" "z"). ())(("ひ" "ヒ" "ﾋ") ("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("t" "f"). ())(("と" "ト" "ﾄ") ("り" "リ" "ﾘ")))
((("t" "g"). ())(("と" "ト" "ﾄ") ("し" "シ" "ｼ") ("て" "テ" "ﾃ")))
((("t" "c"). ())(("つ" "ツ" "ﾂ") ("い" "イ" "ｲ") ("て" "テ" "ﾃ")))
((("t" "r"). ())(("と" "ト" "ﾄ") ("こ" "コ" "ｺ") ("ろ" "ロ" "ﾛ")))
((("t" "l"). ())(("と" "ト" "ﾄ") ("く" "ク" "ｸ")))
((("t" "d"). ())(("と" "ト" "ﾄ") ("い" "イ" "ｲ") ("う" "ウ" "ｳ")))
((("t" "n"). ())(("と" "ト" "ﾄ") ("の" "ノ" "ﾉ")))
((("t" "b"). ())(("た" "タ" "ﾀ") ("び" "ビ" "ﾋﾞ")))
((("t" "m"). ())(("た" "タ" "ﾀ") ("め" "メ" "ﾒ")))
((("t" "v"). ())(("と" "ト" "ﾄ") ("き" "キ" "ｷ")))
((("t" "z"). ())(("て" "テ" "ﾃ") ("き" "キ" "ｷ")))
((("n" "f"). ())(("な" "ナ" "ﾅ") ("り" "リ" "ﾘ")))
((("n" "c"). ())(("に" "ニ" "ﾆ") ("つ" "ツ" "ﾂ") ("い" "イ" "ｲ") ("て" "テ" "ﾃ")))
((("n" "r"). ())(("な" "ナ" "ﾅ") ("る" "ル" "ﾙ")))
((("n" "l"). ())(("な" "ナ" "ﾅ") ("っ" "ッ" "ｯ") ("た" "タ" "ﾀ")))
((("n" "d"). ())(("な" "ナ" "ﾅ") ("ど" "ド" "ﾄﾞ")))
((("n" "b"). ())(("な" "ナ" "ﾅ") ("け" "ケ" "ｹ") ("れ" "レ" "ﾚ") ("ば" "バ" "ﾊﾞ")))
((("n" "m"). ())(("な" "ナ" "ﾅ") ("く" "ク" "ｸ") ("て" "テ" "ﾃ") ("も" "モ" "ﾓ")))
((("n" "w"). ())(("な" "ナ" "ﾅ") ("く" "ク" "ｸ") ("て" "テ" "ﾃ") ("は" "ハ" "ﾊ")))
((("n" "z"). ())(("な" "ナ" "ﾅ") ("く" "ク" "ｸ")))
((("s" "f"). ())(("さ" "サ" "ｻ") ("り" "リ" "ﾘ")))
((("s" "g"). ())(("さ" "サ" "ｻ") ("れ" "レ" "ﾚ")))
((("s" "c"). ())(("し" "シ" "ｼ") ("た" "タ" "ﾀ")))
((("s" "r"). ())(("す" "ス" "ｽ") ("る" "ル" "ﾙ")))
((("s" "d"). ())(("さ" "サ" "ｻ") ("れ" "レ" "ﾚ")))
((("s" "m"). ())(("し" "シ" "ｼ") ("も" "モ" "ﾓ")))
((("s" "n" "b"). ())(("し" "シ" "ｼ") ("な" "ナ" "ﾅ") ("け" "ケ" "ｹ") ("れ" "レ" "ﾚ") ("ば" "バ" "ﾊﾞ")))
((("s" "n" "m"). ())(("し" "シ" "ｼ") ("な" "ナ" "ﾅ") ("く" "ク" "ｸ") ("て" "テ" "ﾃ") ("も" "モ" "ﾓ")))
((("s" "n" "t"). ())(("し" "シ" "ｼ") ("な" "ナ" "ﾅ") ("く" "ク" "ｸ") ("て" "テ" "ﾃ")))
((("s" "n" "w"). ())(("し" "シ" "ｼ") ("な" "ナ" "ﾅ") ("く" "ク" "ｸ") ("て" "テ" "ﾃ") ("は" "ハ" "ﾊ")))
((("s" "z"). ())(("そ" "ソ" "ｿ") ("れ" "レ" "ﾚ") ("ぞ" "ゾ" "ｿﾞ") ("れ" "レ" "ﾚ")))
((("b" "c"). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("b" "r"). ())(("ば" "バ" "ﾊﾞ") ("ら" "ラ" "ﾗ")))
((("b" "l"). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("b" "h"). ())(("ぶ" "ブ" "ﾌﾞ") ("つ" "ツ" "ﾂ")))
((("b" "t"). ())(("べ" "ベ" "ﾍﾞ") ("つ" "ツ" "ﾂ")))
((("m" "c"). ())(("み" "ミ" "ﾐ") ("ゅ" "ュ" "ｭ") ("ー" "ー" "ｰ")))
((("m" "r"). ())(("ま" "マ" "ﾏ") ("る" "ル" "ﾙ")))
((("m" "l"). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("m" "d"). ())(("ま" "マ" "ﾏ") ("で" "デ" "ﾃﾞ")))
((("m" "t"). ())(("ま" "マ" "ﾏ") ("た" "タ" "ﾀ")))
((("m" "n"). ())(("も" "モ" "ﾓ") ("の" "ノ" "ﾉ")))
((("m" "s"). ())(("ま" "マ" "ﾏ") ("す" "ス" "ｽ")))
((("m" "m"). ())(("お" "オ" "ｵ") ("も" "モ" "ﾓ")))
((("w" "r"). ())(("わ" "ワ" "ﾜ") ("れ" "レ" "ﾚ")))
((("w" "t"). ())(("わ" "ワ" "ﾜ") ("た" "タ" "ﾀ") ("し" "シ" "ｼ")))
((("w" "n"). ())(("わ" "ワ" "ﾜ") ("れ" "レ" "ﾚ") ("わ" "ワ" "ﾜ") ("れ" "レ" "ﾚ")))
((("v" "m"). ())(("こ" "コ" "ｺ") ("と" "ト" "ﾄ") ("な" "ナ" "ﾅ")))
((("v" "v"). ())(("お" "オ" "ｵ") ("な" "ナ" "ﾅ") ("じ" "ジ" "ｼﾞ")))
((("z" "c"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("z" "r"). ())(("ざ" "ザ" "ｻﾞ") ("る" "ル" "ﾙ")))
((("z" "t"). ())(("ず" "ズ" "ｽﾞ") ("つ" "ツ" "ﾂ")))
((("z" "n"). ())(("ぞ" "ゾ" "ｿﾞ") ("く" "ク" "ｸ")))
((("z" "s"). ())(("ざ" "ザ" "ｻﾞ") ("く" "ク" "ｸ")))
((("p" "f"). ())(("ぷ" "プ" "ﾌﾟ") ("り" "リ" "ﾘ")))
((("p" "g"). ())(("ぷ" "プ" "ﾌﾟ") ("る" "ル" "ﾙ")))
((("p" "r"). ())(("ぷ" "プ" "ﾌﾟ") ("ろ" "ロ" "ﾛ")))
((("t" "w" "a"). ())(("て" "テ" "ﾃ") ("ゃ" "ャ" "ｬ")))
((("t" "w" "i"). ())(("て" "テ" "ﾃ") ("ぃ" "ィ" "ｨ")))
((("t" "w" "u"). ())(("て" "テ" "ﾃ") ("ゅ" "ュ" "ｭ")))
((("t" "w" "e"). ())(("て" "テ" "ﾃ") ("ぇ" "ェ" "ｪ")))
((("t" "w" "o"). ())(("て" "テ" "ﾃ") ("ょ" "ョ" "ｮ")))
((("t" "w" ";"). ())(("て" "テ" "ﾃ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("t" "w" "x"). ())(("て" "テ" "ﾃ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("t" "w" "k"). ())(("て" "テ" "ﾃ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("t" "w" "j"). ())(("て" "テ" "ﾃ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("t" "w" "q"). ())(("て" "テ" "ﾃ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("t" "w" "'"). ())(("て" "テ" "ﾃ") ("ゃ" "ャ" "ｬ") ("う" "ウ" "ｳ")))
((("t" "w" "p"). ())(("て" "テ" "ﾃ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("t" "w" "."). ())(("て" "テ" "ﾃ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("t" "w" ","). ())(("て" "テ" "ﾃ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("d" "b" "a"). ())(("で" "デ" "ﾃﾞ") ("ゃ" "ャ" "ｬ")))
((("d" "b" "i"). ())(("で" "デ" "ﾃﾞ") ("ぃ" "ィ" "ｨ")))
((("d" "b" "u"). ())(("で" "デ" "ﾃﾞ") ("ゅ" "ュ" "ｭ")))
((("d" "b" "e"). ())(("で" "デ" "ﾃﾞ") ("ぇ" "ェ" "ｪ")))
((("d" "b" "o"). ())(("で" "デ" "ﾃﾞ") ("ょ" "ョ" "ｮ")))
((("d" "b" ";"). ())(("で" "デ" "ﾃﾞ") ("ゃ" "ャ" "ｬ") ("ん" "ン" "ﾝ")))
((("d" "b" "x"). ())(("で" "デ" "ﾃﾞ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("d" "b" "k"). ())(("で" "デ" "ﾃﾞ") ("ゅ" "ュ" "ｭ") ("ん" "ン" "ﾝ")))
((("d" "b" "j"). ())(("で" "デ" "ﾃﾞ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("d" "b" "q"). ())(("で" "デ" "ﾃﾞ") ("ょ" "ョ" "ｮ") ("ん" "ン" "ﾝ")))
((("d" "b" "'"). ())(("で" "デ" "ﾃﾞ") ("ゃ" "ャ" "ｬ") ("う" "ウ" "ｳ")))
((("d" "b" "p"). ())(("で" "デ" "ﾃﾞ") ("ゅ" "ュ" "ｭ") ("う" "ウ" "ｳ")))
((("d" "b" "."). ())(("で" "デ" "ﾃﾞ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("d" "b" ","). ())(("で" "デ" "ﾃﾞ") ("ょ" "ョ" "ｮ") ("う" "ウ" "ｳ")))
((("w" "m" "a"). ())(("う" "ウ" "ｳ") ("ぁ" "ァ" "ｧ")))
((("w" "m" "i"). ())(("う" "ウ" "ｳ") ("ぃ" "ィ" "ｨ")))
((("w" "m" "u"). ())(("う" "ウ" "ｳ") ("ぅ" "ゥ" "ｩ")))
((("w" "m" "e"). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ")))
((("w" "m" "o"). ())(("う" "ウ" "ｳ") ("ぉ" "ォ" "ｫ")))
((("w" "m" ";"). ())(("う" "ウ" "ｳ") ("ぁ" "ァ" "ｧ") ("ん" "ン" "ﾝ")))
((("w" "m" "x"). ())(("う" "ウ" "ｳ") ("ぃ" "ィ" "ｨ") ("ん" "ン" "ﾝ")))
((("w" "m" "k"). ())(("う" "ウ" "ｳ") ("ぅ" "ゥ" "ｩ") ("ん" "ン" "ﾝ")))
((("w" "m" "j"). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ") ("ん" "ン" "ﾝ")))
((("w" "m" "q"). ())(("う" "ウ" "ｳ") ("ぉ" "ォ" "ｫ") ("ん" "ン" "ﾝ")))
((("w" "m" "'"). ())(("う" "ウ" "ｳ") ("ぁ" "ァ" "ｧ") ("う" "ウ" "ｳ")))
((("w" "m" "p"). ())(("う" "ウ" "ｳ") ("ぅ" "ゥ" "ｩ") ("う" "ウ" "ｳ")))
((("w" "m" "."). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ") ("い" "イ" "ｲ")))
((("w" "m" ","). ())(("う" "ウ" "ｳ") ("ぉ" "ォ" "ｫ") ("う" "ウ" "ｳ")))
((("c" "y"). ())(("く" "ク" "ｸ") ("い" "イ" "ｲ")))
((("s" "y"). ())(("す" "ス" "ｽ") ("い" "イ" "ｲ")))
((("t" "y"). ())(("つ" "ツ" "ﾂ") ("い" "イ" "ｲ")))
((("n" "y"). ())(("ぬ" "ヌ" "ﾇ") ("い" "イ" "ｲ")))
((("h" "y"). ())(("ふ" "フ" "ﾌ") ("い" "イ" "ｲ")))
((("m" "y"). ())(("む" "ム" "ﾑ") ("い" "イ" "ｲ")))
((("y" "y"). ())(("ゆ" "ユ" "ﾕ") ("い" "イ" "ｲ")))
((("r" "y"). ())(("る" "ル" "ﾙ") ("い" "イ" "ｲ")))
((("w" "y"). ())(("う" "ウ" "ｳ") ("い" "イ" "ｲ")))
((("g" "y"). ())(("ぐ" "グ" "ｸﾞ") ("い" "イ" "ｲ")))
((("z" "y"). ())(("ず" "ズ" "ｽﾞ") ("い" "イ" "ｲ")))
((("d" "y"). ())(("づ" "ヅ" "ﾂﾞ") ("い" "イ" "ｲ")))
((("b" "y"). ())(("ぶ" "ブ" "ﾌﾞ") ("い" "イ" "ｲ")))
((("p" "y"). ())(("ぷ" "プ" "ﾌﾟ") ("い" "イ" "ｲ")))
((("c" "g" "y"). ())(("き" "キ" "ｷ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("s" "h" "y"). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("t" "h" "y"). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("n" "h" "y"). ())(("に" "ニ" "ﾆ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("h" "n" "y"). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("m" "v" "y"). ())(("み" "ミ" "ﾐ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("r" "g" "y"). ())(("り" "リ" "ﾘ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("g" "r" "y"). ())(("ぎ" "ギ" "ｷﾞ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("z" "m" "y"). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("d" "n" "y"). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("b" "v" "y"). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("p" "n" "y"). ())(("ぴ" "ピ" "ﾋﾟ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("f" "y"). ())(("ふ" "フ" "ﾌ") ("い" "イ" "ｲ")))
((("v" "y"). ())(("う゛" "ヴ" "ｳﾞ") ("い" "イ" "ｲ")))
((("t" "w" "y"). ())(("て" "テ" "ﾃ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("d" "b" "y"). ())(("で" "デ" "ﾃﾞ") ("ゅ" "ュ" "ｭ") ("い" "イ" "ｲ")))
((("w" "m" "y"). ())(("う" "ウ" "ｳ") ("ぅ" "ゥ" "ｩ") ("い" "イ" "ｲ")))

))


(define ja-act-rule (append ja-act-rule-basic (filter (lambda (x) (not (ichar-alphabetic? (string->charcode (caaar x))))) ja-rk-rule-basic)))

(define ja-act-skk-okuri-char-alist '(("c" . "k") ("'" . "t") (";" . "a") ("q" . "o") ("j" . "e") ("k" . "u") ("x" . "i")))
(define ja-act-skk-downcase-alist (alist->icharlist '(("\"" . "'") (":" . ";"))))
(define ja-act-skk-set-henkan-point-key (map string->charcode '("'" ";" "q" "j" "k" "x")))



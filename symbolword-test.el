(require 'ert)
(require 'symbolword-rule)

(ert-deftest sub-word ()
  (should
   (symbolword/div-word? ?a ?A)))

(ert-deftest begin-space ()
  (should
   (symbolword/div-word? ?a ?\s)))

(ert-deftest begin-line ()
  (should
   (symbolword/div-word? ?a ?\n)))

(ert-deftest nil-test ()
  (should
   (symbolword/div-word? nil nil)))

(ert-run-tests-batch)

(provide 'symbolword-test)
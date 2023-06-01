;; disable inlining to allow extra predicates to split initial state
(set-option :fp.xform.inline_linear false)
(set-option :fp.xform.inline_eager false)
(set-option :fp.xform.slice false)

;; enable global guidance
(set-option :fp.spacer.global true)

;; don't let spacer run too far
(set-option :fp.spacer.max_level 20)


(declare-rel inv0 (Int Int))
(declare-rel inv (Int Int))
(declare-var x0 Int)
(declare-var x1 Int)
(declare-var y0 Int)
(declare-var y1 Int)

(declare-var N Int)

(declare-rel fail ())

(rule (inv0 0 0))
(rule (=> (and (inv0 x0 y0)) (inv x0 y0)))

(rule (=> (and
          (inv x0 y0)
          (= x1 (+ x0 1))
          (= y1 (ite (= (mod x0 2) 0) (+ y0 1) y0)))
         (inv x1 y1)
         ))

;; (rule (=> (and (inv x0 y0) (= x0 (* 2 1351235)) (not (= y0 1351235))) fail))
;; abstract away the number in the property
(rule (=> (and (inv x0 y0) (= x0 (* 2 N)) (not (= y0 N))) fail))

(query fail)

(exit)


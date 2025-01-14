(declare-rel inv (Int Int))
(declare-var x0 Int)
(declare-var x1 Int)
(declare-var y0 Int)
(declare-var y1 Int)

(declare-rel fail ())

(rule (=> (and (= x0 0) (= y0 0))
    (inv x0 y0)))

(rule (=> (and
        (inv x0 y0)
        (= x1 (+ x0 1))
        (= y1 (ite (= (mod x0 2) 0) (+ y0 1) y0)))
    (inv x1 y1)))

(rule (=> (and (inv x0 y0) (= (mod x0 2) 0)
    (not (= x0 (* 2 y0)))) fail))

(query fail)

(deffacts BH
    (pila1 A B mesa C)
    (pila2 E mesa D)
    (brazo)
)

(defrule comprobar
    (declare(salience 100))
    (pila1 ?CajaD ?cajaB ?cajaE  mesa ?CajaA)
    (pila2 mesa ?CajaC)
    (test and((= ?CajaD D) (= ?CajaB B) (= ?CajaE E) (= ?CajaA A) (= ?CajaC C)))
    =>
    (printout t "FIN" crlf)
    (halt)
)

(defrule desapilar
    (brazo ?caja)
    (pila1 $?ini ?CajaPila $?fin mesa $?ini2 ?CajaMesa $?fin2)
    (pila2 $?ini3 ?CajaPila2 $?fin3)
    (test (and ( (=(length ?caja)0) (=(length $?fin)0))))
    =>
    (assert (pila1 $?ini $?fin mesa $?ini2 ?CajaMesa $?fin2))
    (assert (pila2 ?CajaPila $?ini3 ?CajaPila2 $?fin3))
)
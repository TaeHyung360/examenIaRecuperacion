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
    (pila2 $?ini3 ?CajaPila2 $?fin3 mesa $?ini4 ?CajaMesa2 $?fin4)
    (test (and ( (=(length ?caja)0) (=(length $?ini)0))))
    (test ((=(length $?ini3)0))))
    =>
    (assert (pila1 $?ini $?fin mesa $?ini2 ?CajaMesa $?fin2))
    (assert (pila2 ?CajaPila $?ini3 ?CajaPila2 $?fin3 mesa $?ini4 ?CajaMesa2 $?fin4))
)

(defrule apilar
    (pila1 $?ini ?CajaPila $?fin mesa $?ini2 ?CajaMesa $?fin2)
    (pila2 $?ini3 ?CajaPila2 $?fin3 mesa $?ini4 ?CajaMesa4 $?fin4)
    (brazo ?CajaPila)
    (test (and ( (=(length ?CajaPila)1) (=(length $?ini3)0))))
    =>
    (assert (pila1 $?ini $?fin mesa $?ini2 ?CajaMesa $?fin2))
    (assert (pila2 $?ini3 ?CajaPila2 $?fin3 mesa CajaPila $?ini4 ?CajaMesa $?fin4))
)

(defrule cogerUnBLoque
    (brazo ?caja)
    (pila1 $?ini ?CajaPila $?fin mesa $?ini2 ?CajaMesa $?fin2)
    (pila2 $?ini3 ?CajaPila2 $?fin3 mesa $?ini4 ?CajaMesa4 $?fin4)
    (test (and ( (=(length ?caja)0) (=(length $?ini2)0))))
    =>
    (assert (pila1 $?ini ?CajaPila $?fin mesa $?ini2 $?fin2))
    (assert (pila2 ?CajaMesa $?ini3 ?CajaPila2 $?fin3? CajaPila2 $?fin3))
)

(defrule dejarUnBLoque
    
    (pila1 $?ini ?CajaPila $?fin mesa $?ini2 ?CajaMesa $?fin2)
    (pila2 $?ini3 ?CajaPila2 $?fin3 mesa $?ini4 ?CajaMesa4 $?fin4)
    (brazo ?CajaPila)
    (test (and ( (=(length ?caja)1) (=(length $?ini4)0))))
    =>
    (assert (pila1 $?ini $?fin mesa $?ini2 ?CajaMesa $?fin2))
    (assert (pila2 $?ini3 ?CajaPila2 $?fin3 mesa ?CajaPila $?ini4 ?CajaMesa4 $?fin4))
)

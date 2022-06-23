(deffacts BH
    (pila1 A B mesa C)
    (pila2 E mesa D)
    (brazo)
)

(defrule comprobar
    (declare(salience 100))
    (pila1 ?CajaD ?cajaB ?cajaE  mesa ?CajaA)
    (pila2 mesa ?CajaC)
    (test (= ?CajaD D))
    (test (= ?CajaB B))
    (test (= ?CajaE E))
    (test (= ?CajaA A))
    (test (= ?CajaC C))
    =>
    (printout t "FIN" crlf)
    (halt)
)

(defrule desapilar
    (brazo ?caja)
    (pila1 $?ini ?CajaPila $?fin mesa $?ini ?CajaMesa $?fin)
    (Pila2 $?ini ?CajaPila2 $?fin)
)
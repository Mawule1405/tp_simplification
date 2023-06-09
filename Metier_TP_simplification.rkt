#lang scheme
(provide operateur operande1 operande2 constructeur constante? identificateur? surparenthese?)


                                          
                                           
(define operateur (lambda (exp)              ;la fonction operateur:expression -----> operateur
                  (car (cdr exp))            ;elle renvoie l'operateur principale d'une expression arithmétique
        ))



                                                                        
                                                                        
(define operande1 (lambda (exp)              ;la fonction operande1 : expression ----> expression
                 (car exp)                   ;elle renvoie la première opérande d'une expression arithmétique.
        ))



                                                                        
                                                                       
(define operande2 (lambda (exp)              ;la fonction opereande2 : expression ----> expression
                 (car (cdr (cdr exp)))       ;elle renvoie la deuxième opérande d'une expression arithmétique.
        ))


                                                                        
                                                                        
(define constante? (lambda (exp)                 ;la fonction const?: expression ----> booléen
                  (number? exp)              ;elle renvoie vrai si l'expression est une constante et faux sinon.
             ))

                                                                        
                                                                       
(define identificateur? (lambda (exp)                    ;la fonction id?: expression -----> booléen
              (symbol? exp)                  ;elle renvoie vrai si l'expression est un identificateur et faux sinon
              ))

                                                                        
                                                                        
(define surparenthese? (lambda (exp)          ;la fonction : expression -----> booléen
                  (= (length exp) 1)
                         ))

(define constructeur (lambda (exp1 operateur exp2)
                       (list exp1 operateur exp2)
                       ))
                   
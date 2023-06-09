#lang scheme
;importation des donctions du fichier Metier_TP_simplification.rkt
(require "Metier_TP_simplification.rkt")
(provide simplification)


(define simp* (lambda (exp)                                                                                    ;simp* : expression ----> expression
          (cond
              ((eq? (simplification (operande1 exp)) 1)             (simplification (operande2 exp)))          ;operande1 = 1                                                                             
              ((eq? (simplification (operande2 exp)) 1)             (simplification (operande1 exp)))          ;operande2 = 1

              ((or (eq? (simplification (operande1 exp))  0)                                                   ;l'un des operandes est null
                   (eq? (simplification (operande2 exp)) 0))       0)
        
             ((and (constante? (simplification (operande1 exp)))
                   (constante? (simplification (operande2 exp))))   (* (simplification (operande1 exp))
                                                                    (simplification (operande2 exp))))        ;les deux operandes sont des constants

            (#t                                                     (list (simplification (operande1 exp))    ;au moins un des operandes est une liste
                                                                          (operateur exp)
                                                                          (simplification (operande2 exp))))
            )))




(define simp+ (lambda (exp)                                                                                     ;simp+: expression ----> expression
          (cond
            ((eq? (simplification (operande1 exp)) 0)              (simplification (operande2 exp)))            ;operande1 = 0
            ((eq? (simplification (operande2 exp)) 0)              (simplification (operande1 exp)))            ;operande2 = 0

            ((and (constante? (simplification (operande1 exp)))
                  (constante? (simplification (operande2 exp))))   (+ (simplification (operande1 exp))
                                                                      (simplification (operande2 exp))))         ;les deux operandes sont des constants

            (#t                                                    (list (simplification (operande1 exp))        ;au moins un des operandes est une liste
                                                                         (operateur exp)
                                                                         (simplification (operande2 exp))))
          )))



 
(define simplification (lambda (exp)                                                              ;simplifier: expression -----> expression
                (cond                                                                             ;Elle renvoie l'expression simplifier
                   ((or (identificateur? exp)
                        (constante? exp))            exp)
                   
                   ((surparenthese? exp)             (simplification (car exp)))                  ;Elever les parenthèse supplémentaire
                   
                   ((eq? '+ (operateur exp))         (simp+ exp))                                 ;simplifier si l'operateur est +
                   
                   ((eq? '* (operateur exp))         (simp* exp))                                 ;simplifier si l'operateur est *
                )))



;(simplification '((x + (1 * y)) + (x + 0)))
;(simplification '((4 * (x + 2))))
;(simplification '(4 + (2 * 3)))



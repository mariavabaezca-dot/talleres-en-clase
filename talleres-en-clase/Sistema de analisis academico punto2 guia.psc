Algoritmo Analisis_academico
	Definir nEstudiantes Como Entero
	Definir i, j Como Entero
	
	Definir nombre Como Cadena
	Definir nota1, nota2, nota3 Como Real
	Definir promedio Como Real
	Definir estado Como Cadena
	Definir aprobados, reprobados Como Entero
	Definir aprobaronTres Como Entero
	Definir porcentajeAprobacion Como Real
	Definir sumaPromedios, promedioGeneral Como Real
	Definir mayorPromedio, menorPromedio Como Real
	Definir estudianteMayor, estudianteMenor Como Cadena
	Definir primeraVez Como Logico
	Definir notasValidas Como Logico	
	
	aprobados<-0
	reprobados<-0
	aprobaronTres<-0
	sumaPromedios<-0
	primeraVez<- Verdadero
	//
	Repetir
		Escribir "¿Cuantos estudiantes desea ingresar?"
		leer nEstudiantes
		si nEstudiantes<=0 Entonces
			Escribir "Error:debe ingresar un numero mayor a 0"
		FinSi
	Hasta Que nEstudiantes>0
	
	para i<-1 hasta nEstudiantes hacer
		Escribir ""
		Escribir "_________ESTUDIANTE",i,"____________"
		Escribir "Digite el nombre del estudiante:"
		leer nombre
		
		para j<-1 hasta 3 Hacer
			notasValidas<- Falso
			Repetir
				si j=1 Entonces
					Escribir "Digite la nota 1(0.0-5.0)"
					leer nota1
					si nota1>= 0 y nota1<=5 Entonces
						notasValidas<-Verdadero
					SiNo
						Escribir "error:la nota valida debe estar entre (0.0-5.0)"
						
					FinSi
				SiNo
					si j=2 Entonces
						Escribir "Digite la nota 2"
						Leer nota2
						si nota2>=0 y nota2<=5 Entonces
							notasValidas<-Verdadero
						SiNo
							Escribir "error:la nota debe estar entre 0.0 y 5.0"
						FinSi
					sino 
						Escribir "Digite la nota 3"
						leer nota3
						si nota3>=0 y nota3<=5 Entonces
							notasValidas<- Verdadero
						SiNo
							Escribir "error: las notas van desde 0.0 hasta 5.0"
						FinSi
						
					FinSi
				FinSi
			Hasta Que notasValidas=Verdadero
		FinPara
		promedio<-calcularpromedio(nota1,nota2,nota3)
		estado<-determinarEstado(promedio)
		si promedio>=3.0 Entonces
			aprobados<-aprobados+1
		SiNo
			reprobados<-reprobados+1
		FinSi
		sumaPromedios<- sumaPromedios+promedio
		
		si nota1>=3.0 y nota2>=3.0 y nota3>=3.0 Entonces
			aprobaronTres<-aprobaronTres+1
		FinSi
		si primeraVez=Verdadero Entonces
			mayorPromedio<-promedio
			menorPromedio<-promedio
			
			estudianteMayor<-nombre
			estudianteMenor<-nombre
			
			primeraVez<-Falso
		SiNo
			si promedio>mayorPromedio Entonces
				mayorPromedio<-promedio
				estudianteMayor<-nombre
			FinSi
		FinSi
		// mostrar resultado individual
		Escribir ""
		Escribir "______________________________"
		Escribir "estudiante:",nombre
		Escribir "nota1:",nota1
		Escribir "nota2:",nota2
		Escribir "nota3:",nota3
		Escribir "Promedio:",promedio
		Escribir "estado:",estado
		Si nota1 >= 3.0 Y nota2 >= 3.0 Y nota3 >= 3.0 Entonces
			Escribir "Aprobo las tres notas individualmente: SI"
		SiNo
			Escribir "Aprobo las tres notas individualmente: NO"
		FinSi
		
		Escribir "________________________________"
		
	FinPara
	promedioGeneral <- sumaPromedios / nEstudiantes
	porcentajeAprobacion <- (aprobados * 100) / nEstudiantes
	
	
	// Mostrar resumen
	Escribir ""
	Escribir "_______________________________________"
	Escribir "       RESUMEN GENERAL DEL GRUPO"
	Escribir "____________________________________"
	Escribir "Cantidad de estudiantes: ", nEstudiantes
	Escribir "Estudiantes aprobados: ", aprobados
	Escribir "Estudiantes reprobados: ", reprobados
	Escribir "Porcentaje de aprobacion: ", porcentajeAprobacion, "%"
	Escribir "Promedio general del grupo: ", promedioGeneral
	Escribir "Estudiante con mayor promedio: ", estudianteMayor
	Escribir "Mayor promedio: ", mayorPromedio
	Escribir "Estudiante con menor promedio: ", estudianteMenor
	Escribir "Menor promedio: ", menorPromedio
	Escribir "Estudiantes que aprobaron las tres notas: ", aprobaronTres
	Escribir "__________________________---"
	
	
FinAlgoritmo
//
Funcion promedio<-calcularpromedio(nota1,nota2,nota3)
	Definir promedio Como Real
	promedio <-(nota1+nota2+nota3)/3
FinFuncion

Funcion estado<- determinarEstado(promedio)
	Definir estado como cadena
	si promedio<3.0 Entonces
		estado<- "reprobado"
	SiNo
		si promedio<4.0 Entonces
			estado<-"Aprobado"
		SiNo
			si promedio<=4.5 Entonces
				estado<- "Sobresaliente"
			SiNo
				estado<-"excelente"
			FinSi
		FinSi
	FinSi
FinFuncion
	
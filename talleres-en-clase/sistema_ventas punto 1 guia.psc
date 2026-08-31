Algoritmo sistema_ventas
	Definir clientes,productos,i,j,cantidad Como Entero
	Definir nombre_cliente,nombre_producto como cadena
	Definir precio,subtotal_producto,subtotal_compra,descuento,valor_descuento Como Real
	Definir valor_descontado, iva,total_final Como Real
	Definir total_vendido,promedio_compra Como Real
	Definir mayor_compra Como Real
	definir cliente_mayor como cadena
	Definir porcentaje_descuento Como Real
	Definir mayorh Como Logico
	
	total_vendido<-0
	mayor_compra<-0
	cliente_mayor<-""
	mayorh<-Falso
	//
	Repetir
		Escribir "Cuantos clientes seran atendidos?"
		leer clientes
		si clientes<=0 Entonces
			Escribir "error:debe ingresar un numero mayor de 0"
		FinSi
	Hasta Que clientes>0
	para i<-1 hasta clientes Hacer
		Escribir ""
		Escribir "______CLIENTE",i,"________"
		Escribir "Digite el nombre del cliente"
		leer nombre_cliente
		
		Repetir
			Escribir "Cuantos productos comprara?"
			Leer productos
			si productos<=0 Entonces
				Escribir "error:debe ingresar una cantidad mayor a 0"
			FinSi
			
		Hasta Que productos>0
		
		subtotal_compra<-0
		para j<-1 hasta productos Hacer
			Escribir ""
			Escribir "producto",j
			Escribir "Digite el nombre del producto:"
			leer nombre_producto
			
			Repetir
				Escribir "Digite el precio unitario:"
				leer precio
				si precio<=0 Entonces
					Escribir "error: el precio debe ser mayor que 0"
				FinSi
			Hasta Que precio >0
			Repetir
				Escribir "Digite la cantidad adquirida:"
				leer cantidad
				si cantidad<=0 Entonces
					Escribir "error:la cantidad debe ser mayor a 0"
				FinSi
			Hasta Que cantidad > 0 
			subtotal_producto<- precio*cantidad
			subtotal_compra<- subtotal_compra+subtotal_producto
			Escribir "El subtotal del producto es: $", subtotal_producto
		FinPara
		// calcular descuento
		porcentaje_descuento<- calcular(subtotal_compra)
		valor_descuento<-subtotal_compra*porcentaje_descuento
		valor_descontado<-subtotal_compra-valor_descuento
		
		//iva
		iva<-calcIVA(valor_descontado)
		// totalfinal
		total_final<-valor_descontado+iva
		//acumulador del total vendido
		total_vendido<-total_vendido+total_final
		//cliente con mayor compra
		si mayorh=Falso entonces 
			mayor_compra<-total_final
			cliente_mayor<-nombre_cliente
			mayorh<-Verdadero
		SiNo
		si total_final>mayor_compra Entonces
			mayor_compra<-total_final
			cliente_mayor<-nombre_cliente
		FinSi
	FinSi
	Escribir ""
	Escribir "___________________________________"
	Escribir "factura del cliente",nombre_cliente
	Escribir "El subtotal es : $",subtotal_compra
	Escribir "descuento:$ ",valor_descuento
	Escribir "IVA(19%):",IVA
	Escribir "TOTAL FINAL A PAGAR: $", total_final
	Escribir "____________________________________"
FinPara

promedio_compra<-total_vendido/clientes

//RESUMEN FiNAL
Escribir ""
Escribir "____________________________________"
Escribir "           RESUMEN DEL DIA         "
Escribir "____________________________________"
Escribir "Clientes atendidos:",clientes
Escribir "valor total vendido:$",total_vendido
Escribir "Promedio de compra por cliente:$",promedio_compra
Escribir "Cliente con mayor compra:",cliente_mayor
Escribir "valor de la mayor compra es:",mayor_compra
Escribir "_____________________________________________"
FinAlgoritmo
//
Funcion decuento<-calcular(subtotal)
	Definir descuento Como Real
	si subtotal<-100000 Entonces
		descuento<-0
	SiNo
		si subtotal<-300000 entonces
			descuento<-0.05
		SiNo
			descuento<-0.10
		FinSi
	FinSi
FinFuncion
funcion iva<-calcIVA(valor)
	Definir iva Como Real
	iva<-valor*0.19
FinFuncion
	
-------------------------------------------------
Escuela Polit�cnica Nacional
Doctorado en Ingenier�a El�ctrica
Redes Neuronales
Tarea 4: Random Forest
-------------------------------------------------

-------------------------------------------------
Elaborado por: David Fabi�n Cevallos Salas
Fecha: 2023-07-27
-------------------------------------------------

En la presente tarea analizaremos mediante Random Forests los datasets Computer Hardware, carsmall y Tratamiento Regresion para compararlos con los modelos de regresi�n 
logrados a trav�s de un �nico �rbol de decisi�n.

Se ha llevado a cabo una soluci�n empleando Matlab y una segunda soluci�n empleando Python.

Soluci�n Matlab:
----------------
Copie los ficheros de nombres DavidCevallos_Tarea4.mlx, machine.txt y Tratamientoregresion.xlsx en una misma carpeta. Abra el fichero de nombre DavidCevallos_Tarea4.mlx
y ejec�telo para visualizar los resultados en pantalla.

El PDF de nombre Solucion_Matlab.pdf posee los resultados descritos en un documento PDF.


Soluci�n Python:
----------------
Acceda al enlace de Google Colab para visualizar la soluci�n en Python:

https://colab.research.google.com/drive/1TjaF2EfA5GJzp_5tPnFU9qOMSTCS9lks

Si se desea ejecutar nuevamente el  notebook, procure cargar en la carpeta home del ambiente los archivos de nombre machine.data, carsmall.txt y TratamientoRegresion.xlsx; 
y verificar que la ruta hacia estos ficheros se encuentren correctamente establecidas en las l�neas de c�digo:

data = pd.read_csv("/home/machine.data", header=None)
data = pd.read_csv("/home/carsmall.txt", header=None)
data = pd.read_excel("/home/TratamientoRegresion.xlsx", header=None)


El PDF de nombre Solucion_Python.pdf posee los resultados descritos en un documento PDF.

Nota: Debido al l�mite de 3MB en el aula virtual no se pudo subir el notebook de Python y su PDF, el cual se encuentra disponible en el enlace Google Colab indicado as� como 
tambi�n junto con todos los dem�s ficheros en el repositorio GitHub:

https://github.com/davidcepn/RedesNeuronales/tree/main/Tarea%204
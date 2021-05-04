     
    
    /* Nombre de las listas del programa  */
    /* registroinf: todas las materias de ingenieria informatica  */
    /* registrociv: todas las materias de ingenieria civil  */
    /* materias: es donde se guardaran los registros obtenidos del pdf de secretaria en linea  */
    /* materiasPend: son todas las materias que el estudiante no ha pasado ( en caso de ser nuevo en la carrera esta lista no aplica)  */
    /* materiasFuturas: aqui se guardan las materias que el estudiante podra ver el proximo semestre o en intensivo si se abren */

 
 analizador (materias,listaCarrera) {
 
 /* ------------------------------------------ Inicio del Algoritmo ------------------------------------------------------------------*/  
     
     
     

    
    if (materias!=null) {        /* Si hay materias guardadas en la lista */
        
  var cantidad = materias.length;
        
  /* contando las materias que se han aprobado */
    
  var aprobadas=0;
  for (int i = 0; i < materias.length; i++) {
    
    if (materias[i]["Nota"]>=10) {
      aprobadas++;
      
    } 
  }
        
          
  /* buscando todas las materias que no ha visto el estudiante aun y calculando las UC acumuladas*/

 
   var materiasPend = new List (listaCarrera.length-aprobadas);  
      
  
  var contadorMaterias= 0;
  var flag= 0;
  var UC=0;    
   
  for (int i = 0; i < listaCarrera.length; i++) {
    
    for (int j = 0; j < cantidad; j++) {
        
        if(listaCarrera[i]["Codigo"]==materias[j]["Codigo"] && materias[j]["Nota"]>=10 ) {
        flag=1;
        UC=UC+materias[j]["UC"];
        
      }
         
  
    }
    if (flag==1) {
     
      flag=0;
      
    } else {

           materiasPend[contadorMaterias] = listaCarrera[i];
           contadorMaterias++;
          flag=0;
  
    }
 
}
 
    
 /* buscando las materias que puede ver el estudiante a futuro */
    
   var materiasVer=0;
    contadorMaterias=0;
    
    for (int i = 0; i < materiasPend.length; i++) {   /* Contando la cantidad de materias que se pueden ver y volviendolas elegibles */
    
    for (int j = 0; j < materias.length; j++) { 
      
            for (int k = 0; k < materiasPend[i]["Requisitos"].length; k++) {
       
              if(materiasPend[i]["Requisitos"][k]==materias[j]["Codigo"] && materias[j]["Nota"]>=10 ) {
                
             materiasPend[i]["Requisitos"][k]=0000;
        
                    }      
            }
    }
        
    var requisitosContador=0;    
    for (int j = 0; j < materiasPend[i]["Requisitos"].length; j++)    
     {  
        requisitosContador=requisitosContador+materiasPend[i]["Requisitos"][j];

    } 
        if (requisitosContador==0) { 
            materiasVer++;
        }
        
        if(requisitosContador>1000 ) {
            
        var totalReq=requisitosContador-1000;
            if(UC>=totalReq) {
              
                materiasVer++;
            }
            
        }

} 
    
    var materiasFuturas= new List(materiasVer);
    
    for (int i = 0; i < materiasPend.length; i++) {
    
       
    var requisitosContador=0;    
    for (int j = 0; j < materiasPend[i]["Requisitos"].length; j++)    
     {  
        
        requisitosContador=requisitosContador+materiasPend[i]["Requisitos"][j];
    } 
        
        if (requisitosContador==0) {
            
           materiasFuturas[contadorMaterias]=materiasPend[i];
            var valorf=materiasFuturas[contadorMaterias]["Asignatura"];
            print("$contadorMaterias""- $valorf");
            contadorMaterias++;
        }
        
        if (requisitosContador>1000) {
            
            if(UC>=requisitosContador-1000) {
                
            materiasFuturas[contadorMaterias]=materiasPend[i];
            var valorf=materiasFuturas[contadorMaterias]["Asignatura"];
            print("$contadorMaterias""- $valorf");
            contadorMaterias++;
                        
            }
               
        }
}
    return materiasFuturas;    
     
    } else if(materias==null) { /* Si no existe una lista (no ha visto ninguna materia), se guardan las asignaturas con requisitos 0000 */
        
        
        var flagR=0;
        var contadorM=0;
        for (int i = 0; flagR!=1; i++) {
     
                if (listaCarrera[i]["Requisitos"]==0) {
                
             var valorg=listaCarrera[i]["Asignatura"];
             print(" $valorg");
             contadorM++;
                               
            } else {
                
                flagR=1;  
            }

        }
        
        var materiasFuturas= new List(contadorM);
        
        
            for (int i = 0; i<listaCarrera.length; i++) {
            
            if (listaCarrera[i]["Requisitos"]==0) {
                
             materiasFuturas[i]=listaCarrera[i];
                               
            } else {
                
                flagR=1;  
            }

        }  
        return materiasFuturas;
        
        }
        

    /* ------------------------------------------ Fin del Algoritmo ------------------------------------------------------------------*/
 
 }




void main() {

    
/*-----------------------------------------------------------INICIO de Materias ---------------------------------------------------------- */   
    
    /* Leyenda en variable requisitos */
    /* UC en Requisitos=1xxx , Materias en requisitos = 0xxx  */ 
    
    
    //------------------------ INFORMATICA --------------------//

 var registroinf = new List(53);  /* de 0 a 52 */


  registroinf[0]= {
  "Tipo":"informatica",
  "Codigo": 0001,
   "Asignatura": "Geometría Plana y Trigonometría",
   "UC": 5,
   "Tax": "TA‐6",
"Requisitos":[0000]
 };
  registroinf[1]= {
"Tipo":"informatica",
"Codigo": 0002,
   "Asignatura": "Matemática Básica",
   "UC": 7,
   "Tax": "TA‐6",
"Requisitos":[0000]
 };
  registroinf[2]= {
"Tipo":"informatica",
"Codigo": 0003,
   "Asignatura": "Introducción a la Informática",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0000]
 };
  registroinf[3]= {
"Tipo":"informatica",
"Codigo": 0004,
   "Asignatura": "Comprensión y Producción de Textos",
   "UC": 5,
   "Tax": "TA‐6",
"Requisitos":[0000]
 };
  registroinf[4]= {
"Tipo":"informatica",
"Codigo": 0005,
   "Asignatura": "Identidad, Liderazgo y Compromiso I",
   "UC": 3,
   "Tax": "TA‐1",
"Requisitos":[0000]
 };
  registroinf[5]= {
"Tipo":"informatica",
"Codigo": 0006,
   "Asignatura": "Cálculo I",
   "UC": 9,
   "Tax": "TA‐4",
"Requisitos":[0001,0002]
 };
  registroinf[6]= {
"Tipo":"informatica",
"Codigo": 0007,
   "Asignatura": "Lógica Computacional",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0002,0003]
 };
  registroinf[7]= {
"Tipo":"informatica",
"Codigo": 0008,
   "Asignatura": "Algoritmos y Programación I",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0002,0003]
 };
  registroinf[8]= {
"Tipo":"informatica",
"Codigo": 0009,
   "Asignatura": "Identidad, Liderazgo y Compromiso II",
   "UC": 3,
   "Tax": "TA‐1",
"Requisitos":[0005]
 };
  registroinf[9]= {
"Tipo":"informatica",
"Codigo": 0010,
   "Asignatura": "Cálculo II",
   "UC": 8,
   "Tax": "TA‐4",
"Requisitos":[0006]
 };
  registroinf[10]= {
"Tipo":"informatica",
"Codigo": 0011,
   "Asignatura": "Física General",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0001,0002]
 };
  registroinf[11]= {
"Tipo":"informatica",
"Codigo": 0012,
   "Asignatura": "Matemáticas Discretas",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0006,0007]
 };
  registroinf[12]= {
"Tipo":"informatica",
"Codigo": 0013,
   "Asignatura": "Algoritmos y Programación II",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0008]
 };
  registroinf[13]= {
"Tipo":"informatica",
"Codigo": 0014,
   "Asignatura": "Cálculo III",
   "UC": 7,
   "Tax": "TA‐4",
"Requisitos":[0010]
 };
  registroinf[14]= {
"Tipo":"informatica",
"Codigo": 0015,
   "Asignatura": "Laboratorio de Física Eléctrica",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0006,0011]
 };
  registroinf[15]= {
"Tipo":"informatica",
"Codigo": 0016,
   "Asignatura": "Física Eléctrica",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0006,0011]
 };
  registroinf[16]= {
"Tipo":"informatica",
"Codigo": 0017,
   "Asignatura": "Estructura del Computador",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0013]
 };
  registroinf[17]= {
"Tipo":"informatica",
"Codigo": 0018,
   "Asignatura": "Algoritmos y Programación III",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0012,0013]
 };
  registroinf[18]= {
"Tipo":"informatica",
"Codigo": 0019,
   "Asignatura": "Ecología, Ambiente y Sustentabilidad",
   "UC": 3,
   "Tax": "TA‐1",
"Requisitos":[1077]
 };
  registroinf[19]= {
"Tipo":"informatica", 
"Codigo": 0020,
   "Asignatura": "Cálculo IV",
   "UC": 7,
   "Tax": "TA‐4",
"Requisitos":[0014]
 };
  registroinf[20]= {
"Tipo":"informatica",
"Codigo": 0021,
   "Asignatura": "Circuitos Electrónicos",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0012,0015,0016]
 };
  registroinf[21]= {
"Tipo":"informatica",
"Codigo": 0022,
   "Asignatura": "Sistemas de Operación",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0017]
 };
  registroinf[22]= {
"Tipo":"informatica",
"Codigo": 0023,
   "Asignatura": "Ingeniería del Software",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0018]
 };
  registroinf[23]= {
"Tipo":"informatica",
"Codigo": 0024,
   "Asignatura": "Interacción Humano Computador",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0018]
 };
  registroinf[24]= {
"Tipo":"informatica",
"Codigo": 0025,
   "Asignatura": "Cálculo Numérico",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0020]
 };
  registroinf[25]= {
"Tipo":"informatica",
"Codigo": 0026,
   "Asignatura": "Estadística y Probabilidades",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0014]
 };
  registroinf[26]= {
"Tipo":"informatica",
"Codigo": 0027,
   "Asignatura": "Arquitectura del Computador",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0021]
 };
  registroinf[27]= {
"Tipo":"informatica",
"Codigo": 0028,
   "Asignatura": "Redes de Computadores I",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0021,0022]
 };
  registroinf[28]= {
"Tipo":"informatica",
"Codigo": 0029,
   "Asignatura": "Sistemas de Bases de Datos I",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0023]
 };
  registroinf[29]= {
"Tipo":"informatica",
"Codigo": 0030,
   "Asignatura": "Programación Lineal",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0020]
 };
  registroinf[30]= {
"Tipo":"informatica",
"Codigo": 0031,
   "Asignatura": "Redes de Computadores II",
   "UC": 8,
   "Tax": "TA‐9",
"Requisitos":[0028]
 };
  registroinf[31]= {
"Tipo":"informatica",
"Codigo": 0032,
   "Asignatura": "Metodologia del Software",
   "UC": 6,
   "Tax": "TA‐9",
"Requisitos":[0024,0029]
 };
  registroinf[32]= {
"Tipo":"informatica",
"Codigo": 0033,
   "Asignatura": "Sistemas de Bases de Datos II",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0029]
 };
  registroinf[33]= {
"Tipo":"informatica",
"Codigo": 0034,
   "Asignatura": "Contabilidad General",
   "UC": 4,
   "Tax": "TA‐6",
"Requisitos":[1113]
 };
  registroinf[34]= {
"Tipo":"informatica",
"Codigo": 0035,
   "Asignatura": "Inglés I",
   "UC": 5,
   "Tax": "TA‐6",
"Requisitos":[0000]
 };
  registroinf[35]= {
"Tipo":"informatica",
"Codigo": 0036,
   "Asignatura": "Investigación de Operaciones",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0025,0026]
 };
  registroinf[36]= {
"Tipo":"informatica",
"Codigo": 0037,
   "Asignatura": "Redes de Computadores III",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0031]
 };
  registroinf[37]= {
"Tipo":"informatica",
"Codigo": 0038,
   "Asignatura": "Seminario de Trabajo de Grado",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0032]
 };
  registroinf[38]= {
"Tipo":"informatica",
"Codigo": 0039,
   "Asignatura": "Desarrollo de Software",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0032,0033]
 };
  registroinf[39]= {
"Tipo":"informatica",
"Codigo": 0040,
   "Asignatura": "Ingeniería Económica",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0034]
 };
  registroinf[40]= {
"Tipo":"informatica",
"Codigo": 0041,
   "Asignatura": "Inglés II",
   "UC": 5,
   "Tax": "TA‐6",
"Requisitos":[0035]
 };
  registroinf[41]= {
"Tipo":"informatica",
"Codigo": 0042,
   "Asignatura": "Seguridad Computacional",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0028]
 };
  registroinf[42]= {
"Tipo":"informatica",
"Codigo": 0043,
   "Asignatura": "Sistemas Distribuidos",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0031]
 };
  registroinf[43]= {
"Tipo":"informatica",
"Codigo": 0044,
   "Asignatura": "Emprendimiento",
   "UC": 4,
   "Tax": "TA‐8",
"Requisitos":[0040]
 };
  registroinf[44]= {
"Tipo":"informatica",
"Codigo": 0045,
   "Asignatura": "Electiva",
   "UC": 4,
   "Tax": "TA‐8",
"Requisitos":[1197]
 };
  registroinf[45]= {
"Tipo":"informatica",
"Codigo": 0046,
   "Asignatura": "Inglés Técnico",
   "UC": 4,
   "Tax": "TA‐9",
"Requisitos":[0041]
 };
  registroinf[46]= {
"Tipo":"informatica",
"Codigo": 0047,
   "Asignatura": "Pasantía",
   "UC": 8,
   "Tax": "TA‐7",
"Requisitos":[0039]
 };
  registroinf[47]= {
"Tipo":"informatica",
"Codigo": 0048,
   "Asignatura": "Ética Profesional",
   "UC": 3,
   "Tax": "TA‐2",
"Requisitos":[1232]
 };
  registroinf[48]= {
"Tipo":"informatica",
"Codigo": 0049,
   "Asignatura": "Evaluación de Sistemas Informáticos",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0036]
 };
  registroinf[49]= {
"Tipo":"informatica",
"Codigo": 0050,
   "Asignatura": "Gestión de Proyectos de Software",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0040,0032,0033]
 };
  registroinf[50]= {
"Tipo":"informatica",
"Codigo":0051,
   "Asignatura": "Electiva",
   "UC": 4,
   "Tax": "TA‐8",
"Requisitos":[1197]
 };
 registroinf[51]= {
"Tipo":"informatica",
"Codigo":0052,
   "Asignatura": "Electiva",
   "UC": 4,
   "Tax": "TA‐8",
"Requisitos":[1197]
 };
 registroinf[52]= {
"Tipo":"informatica",
"Codigo":0053,
   "Asignatura": "Trabajo de Grado (TG) o",
   "UC": 21,
   "Tax": "TA‐7",
"Requisitos":[0038,0032,0033]
 };
    
    
    //------------------------- CIVIL ---------------------//
    
var registrociv = new List(68); /* del 0 al 67*/

   registrociv[0]= { 
  "Tipo":"civil",
"Codigo":0053,
   "Asignatura": "Geometría Plana y Trigonometría",
   "UC": 5,
   "Tax": "TA‐6",
   "Requisitos":[0000]
 };
   registrociv[1]= { 
  "Tipo":"civil",
"Codigo":0054,
   "Asignatura": "Matemática Básica",
   "UC": 7,
   "Tax": "TA‐6",
"Requisitos":[0000]
 };
   registrociv[2]= { 
  "Tipo":"civil",
"Codigo":0055,
   "Asignatura": "Dibujo",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0000]
 };
   registrociv[3]= { 
  "Tipo":"civil",
"Codigo":0056,
   "Asignatura": "Introdución a la Ingeniería Civil",
   "UC": 2,
   "Tax": "TA‐8",
"Requisitos":[0000]
 };
   registrociv[4]= { 
  "Tipo":"civil",
"Codigo":0057,
   "Asignatura": "Comprensión y Producción de Textos",
   "UC": 5,
   "Tax": "TA‐6",
"Requisitos":[0000]
 };
   registrociv[5]= { 
  "Tipo":"civil",
"Codigo":0058,
   "Asignatura": "Identidad, Liderazgo y Compromiso I",
   "UC": 3,
   "Tax": "TA‐1",
"Requisitos":[0000]
 };
   registrociv[6]= { 
  "Tipo":"civil",
"Codigo":0059,
   "Asignatura": "Cálculo I",
   "UC": 9,
   "Tax": "TA‐4",
"Requisitos":[0053,0054]
 };
   registrociv[7]= { 
  "Tipo":"civil",
"Codigo":0060,
   "Asignatura": "Geometría Descriptiva I",
   "UC": 8,
   "Tax": "TA‐4",
"Requisitos":[0053,0055]
 };
   registrociv[8]= { 
  "Tipo":"civil",
"Codigo":0061,
   "Asignatura": "Física General",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0053,0054]
 };
   registrociv[9]= { 
  "Tipo":"civil",
"Codigo":0062,
   "Asignatura": "Química I",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0054]
 };
   registrociv[10]= { 
  "Tipo":"civil",
"Codigo":0063,
   "Asignatura": "Identidad, Liderazgo y Compromiso II",
   "UC": 3,
   "Tax": "TA‐1",
"Requisitos":[0058]
 };
   registrociv[11]= { 
  "Tipo":"civil",
"Codigo":0064,
   "Asignatura": "Cálculo II",
   "UC": 8,
   "Tax": "TA‐4",
"Requisitos":[0059]
 };
   registrociv[12]= { 
  "Tipo":"civil",
"Codigo":0065,
   "Asignatura": "Geometría Descriptiva II",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0060]
 };
   registrociv[13]= { 
  "Tipo":"civil",
"Codigo":0066,
   "Asignatura": "Laboratorio de Física General",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0061]
 };
   registrociv[14]= { 
  "Tipo":"civil",
"Codigo":0067,
   "Asignatura": "Estática",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0059,0061]
 };
   registrociv[15]= { 
  "Tipo":"civil",
"Codigo":0068,
   "Asignatura": "Química II",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0062]
 };
   registrociv[16]= { 
  "Tipo":"civil",
"Codigo":0069,
   "Asignatura": "Cálculo III",
   "UC": 7,
   "Tax": "TA‐4",
"Requisitos":[0064]
 };
   registrociv[17]= { 
  "Tipo":"civil",
"Codigo":0070,
   "Asignatura": "Fundamentos de Programación",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[1077]
 };
   registrociv[18]= { 
  "Tipo":"civil",
"Codigo":0071,
   "Asignatura": "Dinámica",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0064,0067]
 };
   registrociv[19]= { 
  "Tipo":"civil",
"Codigo":0072,
   "Asignatura": "Electricidad y Calorimetría",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0064,0067]
 };
   registrociv[20]= { 
  "Tipo":"civil",
"Codigo":0073,
   "Asignatura": "Laboratorio de Química",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0068]
 };
   registrociv[21]= { 
  "Tipo":"civil",
"Codigo":0074,
   "Asignatura": "Ecología, Ambiente y Sustentabilidad",
   "UC": 3,
   "Tax": "TA‐1",
"Requisitos":[1077]
 };
   registrociv[22]= { 
  "Tipo":"civil",
"Codigo":0075,
   "Asignatura": "Calculo IV",
   "UC": 7,
   "Tax": "TA‐4",
"Requisitos":[0069]
 };
   registrociv[23]= { 
  "Tipo":"civil",
"Codigo":0076,
   "Asignatura": "Topografía",
   "UC": 7,
   "Tax": "TA‐4",
"Requisitos":[0065,0070]
 };
   registrociv[24]= { 
  "Tipo":"civil",
"Codigo":0077,
   "Asignatura": "Dibujo Asistido por Computadora",
   "UC": 2,
   "Tax": "TA‐9",
"Requisitos":[0065,0070]
 };
   registrociv[25]= { 
  "Tipo":"civil",
"Codigo":0078,
   "Asignatura": "Instalaciones Eléctricas",
   "UC": 2,
   "Tax": "TA‐8",
"Requisitos":[0072,0065,0070]
 };
   registrociv[26]= { 
  "Tipo":"civil",
"Codigo":0079,
   "Asignatura": "Resistencia de Materiales I",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0071]
 };
   registrociv[27]= { 
  "Tipo":"civil",
"Codigo":0080,
   "Asignatura": "Estadística y Probabilidades",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0069]
 };
   registrociv[28]= { 
  "Tipo":"civil",
"Codigo":0081,
   "Asignatura": "Contabilidad General",
   "UC": 4,
   "Tax": "TA‐6",
"Requisitos":[1113]
 };
   registrociv[29]= { 
  "Tipo":"civil",
"Codigo":0082,
   "Asignatura": "Cálculo Numérico",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0075]
 };
   registrociv[30]= { 
  "Tipo":"civil",
"Codigo":0083,
   "Asignatura": "Resistencia de Materiales II",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0079]
 };
   registrociv[31]= { 
  "Tipo":"civil",
"Codigo":0084,
   "Asignatura": "Materiales de Construcción",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0079,0080]
 };
   registrociv[32]= { 
  "Tipo":"civil",
"Codigo":0085,
   "Asignatura": "Laboratorio de Materiales de Construcción",
   "UC": 2,
   "Tax": "TA‐9",
"Requisitos":[0079,0080]
 };
   registrociv[33]= { 
  "Tipo":"civil",
"Codigo":0086,
   "Asignatura": "Ingeniería Económica",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0081]
 };
   registrociv[34]= { 
  "Tipo":"civil",
"Codigo":0087,
   "Asignatura": "Mecánica de los Fluidos I",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0071,0075]
 };
   registrociv[35]= { 
  "Tipo":"civil",
"Codigo":0088,
   "Asignatura": "Introducción a la Ingeniería Ambiental",
   "UC": 5,
   "Tax": "TA‐2",
"Requisitos":[0073,0074]
 };
   registrociv[36]= { 
  "Tipo":"civil",
"Codigo":0089,
   "Asignatura": "Mecánica de Suelos I",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0079,0087]
 };
   registrociv[37]= { 
  "Tipo":"civil",
"Codigo":0090,
   "Asignatura": "Laboratorio Mecánica de Suelos I",
   "UC": 2,
   "Tax": "TA‐9",
"Requisitos":[0079,0087]
 };
   registrociv[38]= { 
  "Tipo":"civil",
"Codigo":0091,
   "Asignatura": "Estructuras I",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0083]
 };
   registrociv[39]= { 
  "Tipo":"civil",
"Codigo":0092,
   "Asignatura": "Concreto Reforzado I",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0083,0084,0085]
 };
   registrociv[40]= { 
  "Tipo":"civil",
"Codigo":0093,
   "Asignatura": "Laboratorio de Mecánica de los Fluidos",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0087]
 };
   registrociv[41]= { 
  "Tipo":"civil",
"Codigo":0094,
   "Asignatura": "Mecánica de los Fluidos II",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0087]
 };
   registrociv[42]= { 
  "Tipo":"civil",
"Codigo":0095,
   "Asignatura": "Hidrología Básica",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0080,0087]
 };
   registrociv[43]= { 
  "Tipo":"civil",
"Codigo":0096,
   "Asignatura": "Ingeniería Sanitaria I",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0087,0088]
 };
   registrociv[44]= { 
  "Tipo":"civil",
"Codigo":0097,
   "Asignatura": "Vías de Comunicación I",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0076,0095]
 };
   registrociv[45]= { 
  "Tipo":"civil",
"Codigo":0098,
   "Asignatura": "Mecánica de Suelos II",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0089,0090]
 };
   registrociv[46]= { 
  "Tipo":"civil",
"Codigo":0099,
   "Asignatura": "Laboratorio Mecánica de Suelos II",
   "UC": 2,
   "Tax": "TA‐9",
"Requisitos":[0089,0090]
 };
   registrociv[47]= { 
  "Tipo":"civil",
"Codigo":0100,
   "Asignatura": "Estructuras II",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0091]
 };
   registrociv[48]= { 
  "Tipo":"civil",
"Codigo":0101,
   "Asignatura": "Concreto Reforzado II",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0091,0092]
 };
   registrociv[49]= { 
  "Tipo":"civil",
"Codigo":0102,
   "Asignatura": "Hidráulica de Conducciones",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0083,0093,0094]
 };
   registrociv[50]= { 
  "Tipo":"civil",
"Codigo":0103,
   "Asignatura": "Laboratorio de Ingeniería Sanitaria",
   "UC": 3,
   "Tax": "TA‐9",
"Requisitos":[0096]
 };
   registrociv[51]= { 
  "Tipo":"civil",
"Codigo":0104,
   "Asignatura": "Ingeniería Sanitaria II",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0096]
 };
   registrociv[52]= { 
  "Tipo":"civil",
"Codigo":0105,
   "Asignatura": "Etica Profesional",
   "UC": 3,
   "Tax": "TA‐2",
"Requisitos":[1232]
 };
   registrociv[53]= { 
  "Tipo":"civil",
"Codigo":0106,
   "Asignatura": "Vías de Comunicación II",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0097]
 };
   registrociv[54]= { 
  "Tipo":"civil",
"Codigo":0107,
   "Asignatura": "Geología Aplicada",
   "UC": 6,
   "Tax": "TA‐9",
"Requisitos":[0098,0099]
 };
   registrociv[55]= { 
  "Tipo":"civil",
"Codigo":0108,
   "Asignatura": "Estructuras de Acero",
   "UC": 3,
   "Tax": "TA‐4",
"Requisitos":[0091]
 };
   registrociv[56]= { 
  "Tipo":"civil",
"Codigo":0109,
   "Asignatura": "Proyecto Estructural I",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0100,0101]
 };
   registrociv[57]= { 
  "Tipo":"civil",
"Codigo":0110,
   "Asignatura": "Ingeniería Hidráulica I",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0095,0098,0099,0102]
 };
   registrociv[58]= { 
  "Tipo":"civil",
"Codigo":0111,
   "Asignatura": "Infraestructuras hidráulicas en urbanismos",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0102,0103,0104]
 };
   registrociv[59]= { 
  "Tipo":"civil",
"Codigo":0112,
   "Asignatura": "Seminario de Trabajo de Grado",
   "UC": 2,
   "Tax": "TA‐9",
"Requisitos":[1238]
 };
   registrociv[60]= { 
  "Tipo":"civil",
"Codigo":0113,
   "Asignatura": "Electiva",
   "UC": 4,
   "Tax": "TA‐8",
"Requisitos":[1238]
 };
   registrociv[61]= { 
  "Tipo":"civil",
"Codigo":0114,
   "Asignatura": "Electiva o Pasantía",
   "UC": 4,
   "Tax": "TA‐8",
"Requisitos":[1238]
 };
   registrociv[62]= { 
  "Tipo":"civil",
"Codigo":0115,
   "Asignatura": "Ingeniería de Fundaciones",
   "UC": 4,
   "Tax": "TA‐4",
"Requisitos":[0098,0099,0101]
 };
   registrociv[63]= { 
  "Tipo":"civil",
  "Codigo":0116,
   "Asignatura": "Pavimentos",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0098,0099]
 };
   registrociv[64]= { 
  "Tipo":"civil",
  "Codigo":0117,
   "Asignatura": "Proyecto Estructural II",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0109]
 };
   registrociv[65]= { 
  "Tipo":"civil",
  "Codigo":0118,
   "Asignatura": "Instalaciones Sanitarias para Edificaciones",
   "UC": 4,
   "Tax": "TA‐9",
"Requisitos":[0102]
 };
   registrociv[66]= { 
  "Tipo":"civil",
  "Codigo":0119,
   "Asignatura": "Ingeniería Hidráulica II",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0110]
 };
   registrociv[67]= { 
  "Tipo":"civil",
  "Codigo":0120,
   "Asignatura": "Trabajo de Grado",
   "UC": 21,
   "Tax": "TA‐7",
"Requisitos":[0112]
 };
    
    
/*--------------------------------------------------------FIN de Materias --------------------------------------------------------------- */ 
   
 
/* --------------------------------------- INICIO de Ejemplo de una lista Materias sacadas del pdf ------------------------------------- */
    
  var materias = new List(21);
  var cantidad = materias.length;

  materias[0] = {
    "Tipo": "informatica",
    "Codigo": 0001,
    "Asignatura": "Geometría Plana y Trigonometría",
    "UC": 5,
    "Tax": "TA‐6",
    "Requisitos": [0000],
    "Nota": 10
  };
  materias[1] = {
    "Tipo": "informatica",
    "Codigo": 0002,
    "Asignatura": "Matemática Básica",
    "UC": 7,
    "Tax": "TA‐6",
    "Requisitos": [0000],
    "Nota": 9
  };
  materias[2] = {
    "Tipo": "informatica",
    "Codigo": 0003,
    "Asignatura": "Introducción a la Informática",
    "UC": 5,
    "Tax": "TA‐4",
    "Requisitos": [0000],
    "Nota": 12
  };
  materias[3] = {
    "Tipo": "informatica",
    "Codigo": 0004,
    "Asignatura": "Comprensión y Producción de Textos",
    "UC": 5,
    "Tax": "TA‐6",
    "Requisitos": [0000],
    "Nota": 15
  };
  materias[4] = {
    "Tipo": "informatica",
    "Codigo": 0005,
    "Asignatura": "Identidad, Liderazgo y Compromiso I",
    "UC": 3,
    "Tax": "TA‐1",
    "Requisitos": [0000],
    "Nota": 13
  };

  materias[5] = {
    "Tipo": "informatica",
    "Codigo": 0041,
    "Asignatura": "Inglés II",
    "UC": 5,
    "Tax": "TA‐6",
    "Requisitos": [0035],
    "Nota": 14
  };

  materias[6] = {
    "Tipo": "informatica",
    "Codigo": 0035,
    "Asignatura": "Inglés I",
    "UC": 5,
    "Tax": "TA‐6",
    "Requisitos": [0000],
    "Nota": 19
  };

  materias[7] = {
    "Tipo": "informatica",
    "Codigo": 0002,
    "Asignatura": "Matemática Básica",
    "UC": 7,
    "Tax": "TA‐6",
    "Requisitos": [0000],
    "Nota": 10
  };

  materias[8] = {
    "Tipo": "informatica",
    "Codigo": 0006,
    "Asignatura": "Cálculo I",
    "UC": 9,
    "Tax": "TA‐4",
    "Requisitos": [0001, 0002],
    "Nota": 15
  };

  materias[9] = {
    "Tipo": "informatica",
    "Codigo": 0010,
    "Asignatura": "Cálculo II",
    "UC": 8,
    "Tax": "TA‐4",
    "Requisitos": [0006],
    "Nota": 10
  };

  materias[10] = {
    "Tipo": "informatica",
    "Codigo": 0014,
    "Asignatura": "Cálculo III",
    "UC": 7,
    "Tax": "TA‐4",
    "Requisitos": [0010],
    "Nota": 11
  };

  materias[11] = {
    "Tipo": "informatica",
    "Codigo": 0020,
    "Asignatura": "Cálculo IV",
    "UC": 7,
    "Tax": "TA‐4",
    "Requisitos": [0014],
    "Nota": 11
  };
  materias[12] = {
    "Tipo": "informatica",
    "Codigo": 0008,
    "Asignatura": "Algoritmos y Programación I",
    "UC": 8,
    "Tax": "TA‐9",
    "Requisitos": [0002, 0003],
    "Nota": 11
  };

  materias[13] = {
    "Tipo": "informatica",
    "Codigo": 0013,
    "Asignatura": "Algoritmos y Programación II",
    "UC": 8,
    "Tax": "TA‐9",
    "Requisitos": [0008],
    "Nota": 04
  };

  materias[14] = {
    "Tipo": "informatica",
    "Codigo": 0013,
    "Asignatura": "Algoritmos y Programación II",
    "UC": 8,
    "Tax": "TA‐9",
    "Requisitos": [0008],
    "Nota": 08
  };

  materias[15] = {
    "Tipo": "informatica",
    "Codigo": 0013,
    "Asignatura": "Algoritmos y Programación II",
    "UC": 8,
    "Tax": "TA‐9",
    "Requisitos": [0008],
    "Nota": 12
  };
  materias[16] = {
    "Tipo": "informatica",
    "Codigo": 0012,
    "Asignatura": "Matemáticas Discretas",
    "UC": 5,
    "Tax": "TA‐4",
    "Requisitos": [0006, 0007],
    "Nota": 15
  };
    
  materias[17]= {
 "Tipo":"informatica",
"Codigo": 0007,
   "Asignatura": "Lógica Computacional",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0002,0003],
       "Nota": 15
 };
    
    materias[18]= {
"Tipo":"informatica",
"Codigo": 0011,
   "Asignatura": "Física General",
   "UC": 6,
   "Tax": "TA‐4",
"Requisitos":[0001,0002],
        "Nota": 15
 };
    
    materias[19]= {
"Tipo":"informatica",
"Codigo": 0026,
   "Asignatura": "Estadística y Probabilidades",
   "UC": 5,
   "Tax": "TA‐4",
"Requisitos":[0014],
         "Nota": 15
 };
    
     materias[20]= {
"Tipo":"informatica",
"Codigo": 0025,
   "Asignatura": "Cálculo Numérico",
   "UC": 5,
   "Tax": "TA‐9",
"Requisitos":[0020],
          "Nota": 15
 };
    
    
/* ---------------------------------------- FIN de Ejemplo de una lista Materias sacadas del pdf  ------------------------------------*/
    

    //Llamando a la funcion 
    analizador (materias,registroinf);
  
        
}
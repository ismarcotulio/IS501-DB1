/*

@author mruizq@unah.hn
@version 0.1.0
@date 2021/07/18

---------------------------------------------------------------------------------------------
DESCUBRIMIENTOS
1-Se utilizan funciones como envoltorios asincronos, las cuales nos permitiran hacer uso de
la expresion await con el fin de provocar la pausa de funciones asincronas.

2-Se pausan las funciones asincronas ya que se busca que se ejecuten de forma sincrona

3-El objetivo principal es encapsular el conjunto de funcionalidades que nos brinda IndexedDB

4-Sabemos que la mayoria de funcionalidades que nos provee IndexedDB se ejecutan de forma
asincrona, este es el motivo por el cual se decidio hacer uso de promesas que resuelvan
un objeto. Por tanto en ves de retornar el objeto se retorna una promesa que resuleva
dicho objeto. 

5-Hay objetos como request.result que salen del alcance del constructor de una clase debido
a que es obligatorio que sean llamados dentro de eventos asincronos tales como request.onsucess

6-El metodo createStructure se ejecuta siempre al recargar la pagina y este se encarga de garantizar
la correcta creacion de la estructura de base de datos haciendo uso de la API IndexedDB

7-Las funciones restantes son llamadas dependiendo de la interaccion del usuario con los
componentes de la pagina. Por ejemplo cuando se da clic en el boton eliminar primero se 
verifica que exista un registro selecciona en los controles A o B, si es asi,
 se manda a llamar a la funcion deleteData() que a su vez hace uso de funciones encapsuladas
 en la clase IndexedDB para eliminar el registro
--------------------------------------------------------------------------------------------
*/
async function createStructure(){
    

    idb.db = await idb.openRequestSuccess()
    idb.dbVersion = idb.db.version
    await idb.db.close()

 //------------------------------------------------------------------------------

    try{
        idb.dbUpgrade = await idb.openRequestUpgrade()
        idb.createObjectStore("professor", "employeeAccount", ["name"])
        idb.createObjectStore("student", "studentAccount", ["name"])
    }catch(e){}
//---------------------------------------------------------------------------------
    
    idb.db = await idb.openRequestSuccess()
    idb.addData("professor",[ { employeeAccount: "IS501-0701-2-2021-593433", name: "Jose Inestroza"} ])
    idb.addData("student",[ { studentAccount: "20171006559", name: "Marco Ruiz"} ])
    await idb.db.close()

//----------------------------------------------------------------------------------------
    idb.db = await idb.openRequestSuccess()
    let dataProfessor = await idb.getData("professor")
    let dataStudent = await idb.getData("student")
    await idb.db.close()
        
//-------------------------------------------------------------------------------------    
    
    let htmlProfessor = table.generate(dataProfessor, "professor")
    let htmlStudent = table.generate(dataStudent, "student")
    controlA.innerHTML += htmlProfessor
    controlB.innerHTML += htmlStudent
    
}
//--------------------------------------------------------------------------------------

var idb = new IndexedDB("IS")
table = new Table()

var controlA = document.getElementById("controlA-container")
var controlB = document.getElementById("controlB-container")
var professorName = document.getElementById("input-professor-name")
var professorAccount = document.getElementById("input-professor-account")
var studentName = document.getElementById("input-student-name")
var studentAccount = document.getElementById("input-student-account")
var moveDownBtn = document.getElementById("move-down-btn")
var moveTopBtn = document.getElementById("move-top-btn")
var deleteBtn = document.getElementById("delete-btn")
var selectedRow = []

createStructure();

async function setProfessorData(){
    idb.db = await idb.openRequestSuccess()
    let data = await idb.getData("professor")
    await idb.db.close()

    let html = table.generate(data, "professor")
    controlA.innerHTML = html

    cleanFormProfessor()
}

async function addProfessorData(){
    idb.db = await idb.openRequestSuccess()
    idb.addData("professor",[ { employeeAccount: `${professorAccount.value}`, name: `${professorName.value}`} ])
    await idb.db.close()

    setProfessorData()
}

async function setStudentData(){
    idb.db = await idb.openRequestSuccess()
    let data = await idb.getData("student")
    await idb.db.close()

    let html = table.generate(data, "student")
    controlB.innerHTML = html

    cleanFormStudent()
}

async function addStudentData(){
    idb.db = await idb.openRequestSuccess()
    idb.addData("student",[ { studentAccount: `${studentAccount.value}`, name: `${studentName.value}`} ])
    await idb.db.close()

    setStudentData()
}

async function deleteData(){
    selectedRow = []
    rows = document.querySelectorAll(".row")
    for(let row of rows){
        if(row.dataset.selected == "true"){
            selectedRow.push(row.dataset.keypath)
            selectedRow.push(row.dataset.name)
            selectedRow.push(row.dataset.type)
        }
    }
    if(selectedRow[2]){
        idb.db = await idb.openRequestSuccess()
        idb.deleteData(selectedRow[2], selectedRow[0])
        await idb.db.close()

        if(selectedRow[2] == "professor"){
            setProfessorData()
        }else{
            setStudentData()
        }
    }else{
        alert("Seleccione un registro para eliminar")
    }

}

async function moveProfessor(){
    selectedRow = []
    rows = document.querySelectorAll(".row")
    for(let row of rows){
        if(row.dataset.selected == "true"){
            selectedRow.push(row.dataset.keypath)
            selectedRow.push(row.dataset.name)
            selectedRow.push(row.dataset.type)
        }
    }
    if(selectedRow[2] == "professor"){
        idb.db = await idb.openRequestSuccess()
        idb.addData("student",[ { studentAccount: `${selectedRow[0]}`, name: `${selectedRow[1]}`} ])
        idb.deleteData(selectedRow[2], selectedRow[0])
        await idb.db.close()

        setStudentData()
        setProfessorData()
    }else{
        alert("Seleccione un registro del control A")
    }
}

async function moveStudent(){
    selectedRow = []
    rows = document.querySelectorAll(".row")
    for(let row of rows){
        if(row.dataset.selected == "true"){
            selectedRow.push(row.dataset.keypath)
            selectedRow.push(row.dataset.name)
            selectedRow.push(row.dataset.type)
        }
    }
    if(selectedRow[2] == "student"){
        idb.db = await idb.openRequestSuccess()
        idb.addData("professor",[ { employeeAccount: `${selectedRow[0]}`, name: `${selectedRow[1]}`} ])
        idb.deleteData(selectedRow[2], selectedRow[0])
        await idb.db.close()

        setStudentData()
        setProfessorData()
    }else{
        alert("Seleccione un registro del control B")
    }
}

function cleanFormProfessor(){
    professorName.value = ""
    professorAccount.value = ""
}

function cleanFormStudent(){
    studentName.value = ""
    studentAccount.value = ""
}


function selectRow(element){
    rows = document.querySelectorAll(".row")
    for(let row of rows){
        row.style.background = "none"
        row.style.color = "white"
    }
   
    element.style.background = "white"
    element.style.color = "black"
    element.dataset.selected = "true"
}






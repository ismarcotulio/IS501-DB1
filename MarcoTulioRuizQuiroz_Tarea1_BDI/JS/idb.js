/*
@author mruizq@unah.hn
@version 0.1.0
@date 2021/07/18
*/
/*
----------------------------------------------------------------------------------------
1- Se creo la clase IndexedDB con el fin de encapsular la variendad de metodos que nos ofrece
la API y reutilizarlos a conveniencia.

2- En la clase, solamente se contemplan 2 eventos  al solicitar el request para
abrir la base de datos. Estos son: onsuccess y onupgradeneeded; teniendo en cuenta que tambien
existe onerror, entre otros.

3- El resultado de las solicitudes para abrir una base de datos se resuleve en un promesa.
Esto con el objetivo de garantizar que el objeto sea devuelto sin ningun problema.
NOTA: se intento utilizar return sin uso de promesas pero debido a que los metodos de 
IndexedDB se ejecutan de forma asincrona y en forma de eventos (por ejemplo onsuccess). Esto
hace imposible retornar un objeto haciendo uso de tecnicas convencionales o sincronas

4-Todas las funciones que requieran devolver un objeto hacen uso de promesas para
resolver el mismo.

5-el resultado de una solicitud para abrir la base de datos con el evento onupgradeneedeed
se almacena en el atributo dbUpgrade y se manda a llamar cada vez que se requiera cambiar 
la estructura de la base de datos, como por ejemplo crear un ObjectStore.

6-el resultado de una solicitud para abrir la base de datos con el evento onsuccess
se almacena en el atributo db y se manda a llamar cada vez que se requiera manipular
datos en la base de datos, como por ejemplo hacer uso de un Cursor para agregar un registro
en un ObjectStore
*/


class IndexedDB{

    constructor(dbName){
        this.dbName = dbName
        this.dbVersion
        this.db
        this.dbUpgrade
    }

    openRequestSuccess(){
        return new Promise(resolve => {
                let request = window.indexedDB.open(this.dbName)
                request.onsuccess = function(e){
                    resolve(request.result)
                }                 
        });  
    }

    openRequestUpgrade(){
        return new Promise(resolve => {
                let request = window.indexedDB.open(this.dbName,this.dbVersion+1)
                request.onupgradeneeded = function(e){
                    resolve(e.target.result)
                }                 
        });  
    }

    createObjectStore(name, keypath, indexNames){     
        var objectStore = this.dbUpgrade.createObjectStore(name, { keyPath: keypath });
        
        
        for(let indexName of indexNames){
            objectStore.createIndex(indexName, indexName, { unique: false }); 
        }
    }

    addData(objectStoreName, item){
        var transaction = this.db.transaction([objectStoreName], "readwrite");
        var objectStore = transaction.objectStore(objectStoreName);
        var objectStoreRequest = objectStore.add(item[0]);

        objectStoreRequest.onsuccess = function(event) {
            
        };
    }

    getData(objectStoreName) {
        return new Promise(resolve => {
            var listData = []
            var transaction = this.db.transaction([objectStoreName], "readonly");
            var objectStore = transaction.objectStore(objectStoreName);

            objectStore.openCursor().onsuccess = function(event) {
                var cursor = event.target.result;
                
                if(cursor) {
                    listData.push(cursor.value)

                    cursor.continue();
                } else {
                    resolve(listData)
                }
            };
        })
    }

    deleteData(objectStoreName, keypath){
        const transaction = this.db.transaction([objectStoreName], 'readwrite');
        const objectStore = transaction.objectStore(objectStoreName);

        objectStore.openCursor().onsuccess = function(event) {
            const cursor = event.target.result;
            if(cursor) {
                if(cursor.key === keypath) {
                    const request = cursor.delete();
                    request.onsuccess = function() {
                    };
                }
                cursor.continue();
            }
        };
    }

}
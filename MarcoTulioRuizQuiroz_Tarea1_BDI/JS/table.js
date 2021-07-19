/*
@author mruizq@unah.hn
@version 0.1.0
@date 2021/07/18
---------------------------------------------------------------------------------------------
1- Esta clase se creo con el objetivo de encapsular los metodos relacionados con la creacion
y manipulacion de tablas. 

2-solo contiene un metodo que recibe un objeto el cual convertira en un texto que correspondra
a una tabla html, tambien recibe un metadato que servira de guia para establecer otros
metadatos que serviran para implementar funcionalidades en la interfaz

*/
class Table{
    
    constructor(){ }

    generate(items, meta){
        let html = '<table style="position:relative; width: 100%; background:none; color: white;">'
        for(let item of items ){
            html += `
            <tr
                class="row" 
                onclick="selectRow(this)"
                data-keypath="${Object.values(item)[0]}"
                data-name="${Object.values(item)[1]}"
                data-type="${meta}"
                data-selected="false"
            >`
            for(let col of Object.values(item)){
                html += `<td>${col}</td>`
            }
            html += '</tr>'
        }
        html += '</table>'
        return html
        
    }


}
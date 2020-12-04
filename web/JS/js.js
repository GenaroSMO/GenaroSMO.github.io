var ajax, ajaxLista;

window.onload = function () {
    listaRegistro();
};


function getAJAX() {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    //return new XMLHttpRequest();
}


function listaRegistro() {
    ajaxLista = getAJAX();
    id = setInterval(mostrarListaRegistro, 1000);
}



function mostrarListaRegistro() {
    if (ajaxLista) {
        ajaxLista.onreadystatechange = procesaListaRegistro;
        ajaxLista.open("post", "Control_Registro_Horas.jsp");
        ajaxLista.send(null);
    } else {
        alert("error");
    }
}

function procesaListaRegistro() {
    if (ajaxLista.readyState == 4) {
        if (ajaxLista.status == 200) {
            document.getElementById("filas").innerHTML = ajaxLista.responseText;

        }
    }
}





/*
 function crea_cadena_valores() {
 var txtRegion = document.getElementById("JComboxRegiones").value;
 var txtNombre = document.getElementById("txtNombre").value;
 var txtDescripcion = document.getElementById("txtDescripcion").value;
 var txtCosto = document.getElementById("txtCosto").value;
 var txtExistencia = document.getElementById("txtExistencia").value;
 return "txtRegion=" + txtRegion +
 "&txtNombre=" + txtNombre +
 "&txtDescripcion=" + txtDescripcion +
 "&txtCosto=" + txtCosto  +
 "&txtExistencia=" +txtExistencia;
 
 }
 
 
 function registrarProducto() {
 ajax = getAJAX();    
 if (ajax) {        
 ajax.onreadystatechange = procesaRespuesta;
 ajax.open("POST", "registrarProducto.jsp");        
 ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
 var query_string = crea_cadena_valores();
 ajax.send(query_string);
 } else {
 alert("error");
 }
 }
 
 
 
 
 
 
 function procesaRespuesta() {    
 if (ajax.readyState == 4) {
 if (ajax.status == 200) {
 document.getElementById("respuesta").innerHTML = ajax.responseText;
 }
 }
 }
 
 function procesaRespuestaEliminar() {
 if (ajaxEliminar.readyState == 4) {
 if (ajaxEliminar.status == 200) {
 document.getElementById("respuesta").innerHTML = ajaxEliminar.responseText;
 //alert(ajaxEliminar.responseText);
 }
 }
 }*/


//aqui

//aqui
/*
 function eliminar(id) {
 alert("Entra en la funcion Eliminar");
 ajaxEliminar = getAJAX();
 if (ajaxEliminar) {
 ajaxEliminar.onreadystatechange = procesaRespuestaEliminar;
 ajaxEliminar.open("POST", "eliminarProyecto_do.jsp");
 ajaxEliminar.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");        
 ajaxEliminar.send("id=" + id);
 } else {
 alert("error");
 }
 }
 
 */
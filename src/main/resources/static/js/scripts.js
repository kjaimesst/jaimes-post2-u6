document.addEventListener("DOMContentLoaded", function () {

    console.log("Proyecto productos-web cargado correctamente");

    const botonesEliminar = document.querySelectorAll("a[href*='eliminar']");

    botonesEliminar.forEach(btn => {
        btn.addEventListener("click", function (e) {
            const confirmacion = confirm("¿Seguro que quieres eliminar este producto?");
            if (!confirmacion) {
                e.preventDefault();
            }
        });
    });

});
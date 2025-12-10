<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ProductosDAO, modelo.Productos, java.util.List" %>

<%
    ProductosDAO pDao = new ProductosDAO();
    List<Productos> productos = pDao.listar();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Facturar Venta</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="styles/factura.css">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded-3">
        <div class="card-header bg-primary text-white text-center">
            <h3 class="m-0">Realizar venta</h3>
        </div>

        <div class="card-body">

            <form action="VentasServlet" method="post">

                <!-- CLIENTE -->
                <div class="mb-3">
                    <label class="form-label fw-bold">Cliente:</label>
                    <input type="text" name="cliente" class="form-control" required>
                </div>

                <!-- LÍNEAS -->
                <div id="lineas">

                    <div class="row linea mb-3">

                        <!-- PRODUCTO -->
                        <div class="col-md-5">
                            <label class="form-label fw-bold">Producto:</label>

                            <select name="productoId[]" class="form-select" onchange="actualizarPrecio(this)">
                                <% for (Productos p : productos) { %>
                                    <option value="<%= p.getId() %>" 
                                            data-precio="<%= p.getPrecio() %>">
                                        <%= p.getNombre() %> (₡<%= p.getPrecio() %>)
                                    </option>
                                <% } %>
                            </select>
                        </div>

                        <!-- CANTIDAD -->
                        <div class="col-md-3">
                            <label class="form-label fw-bold">Cantidad:</label>
                            <input type="number" name="cantidad[]" class="form-control" value="1" min="1">
                        </div>

                        <!-- PRECIO -->
                        <div class="col-md-2">
                            <label class="form-label fw-bold">Precio:</label>
                            <input type="text" class="form-control precio" readonly>
                        </div>

                    </div>

                </div>

                <!-- BOTONES -->
                <div class="mt-4 d-flex gap-3">
                    <button type="button" class="btn btn-success" onclick="agregarLinea()">
                        ➕ Agregar línea
                    </button>

                    <button type="submit" class="btn btn-primary">
                        💾 Guardar venta
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>

<script>
function actualizarPrecio(select) {
    let precio = select.options[select.selectedIndex].dataset.precio;
    let cont = select.closest(".linea");
    cont.querySelector(".precio").value = precio;
}

function agregarLinea() {
    const cont = document.getElementById('lineas');
    const htmlSelect = document.querySelector('select[name="productoId[]"]').innerHTML;

    const div = document.createElement('div');
    div.className = 'row linea mb-3';

    div.innerHTML = `
        <div class="col-md-5">
            <label class="form-label fw-bold">Producto:</label>
            <select name="productoId[]" class="form-select" onchange="actualizarPrecio(this)">
                ${htmlSelect}
            </select>
        </div>

        <div class="col-md-3">
            <label class="form-label fw-bold">Cantidad:</label>
            <input type="number" name="cantidad[]" class="form-control" value="1">
        </div>

        <div class="col-md-2">
            <label class="form-label fw-bold">Precio:</label>
            <input type="text" class="form-control precio" readonly>
        </div>

        <div class="col-md-2 d-flex align-items-end">
            <button type="button" class="btn btn-danger w-100"
                onclick="this.closest('.linea').remove()">
                ❌ Eliminar
            </button>
        </div>
    `;

    cont.appendChild(div);
}
</script>

</body>
</html>

{include file="header.tpl"}

{include file="nav.tpl"}
<div class="consulta">
    <h3 class="titulos">Listar Posiciones Cliente</h3>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Cuit del Cliente" aria-label="cuit_cliente" aria-describedby="basic-addon2">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button">Buscar</button>
        </div>
    </div>
</div>
<h3>Tablas Cargadas:</h3>
<div class="tablas">
    <div>
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                </tr>
                <tr>
            </tbody>
        </table>
    </div>
</div>
{include file="footer.tpl"}
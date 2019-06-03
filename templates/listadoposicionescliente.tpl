{include file="header.tpl"}
{include file="nav.tpl"}

<h3>Lista Posiciones Del Cliente:</h3>
<div class="tablas">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Cuit Cuil</th>
					<th scope="col">Apellido</th>
                    <th scope="col">Nombre</th>
					<th scope="col">Fecha De Alta</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                   {foreach from=$Clientes item=cliente}
                    <td>{$cliente['cuit_cuil']}</td>
                    <td>{$cliente['apellido']}</td>
					<td>{$cliente['nombre']}</td>
					<td>{$cliente['fecha_alta']}</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
</div>
{include file="footer.tpl"}
{include file="header.tpl"}
{include file="nav.tpl"}
<h3>Tablas Cargadas:</h3>
<div class="tablas">
    <div>
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Cuit Cuil</th>
                    <th scope="col">Nombre</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    {foreach from=$Clientes item=cliente}
                    <td>{$cliente['cuit_cuil']}</td>
                    <td>{$cliente['nombre']}</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
{include file="footer.tpl"}
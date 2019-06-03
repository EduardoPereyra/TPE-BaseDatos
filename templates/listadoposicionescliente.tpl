{include file="header.tpl"}
{include file="nav.tpl"}

<h3>Lista Posiciones Del Cliente:</h3>
<div class="tablas">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Id Alquiler</th>
					<th scope="col">Numero de Posicion</th>
                    <th scope="col">Numero de Fila</th>
					<th scope="col">Numero de Estanteria</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    {foreach from=$Posiciones item=posicion}
                    <td>{$posicion['id_alquiler']}</td>
                    <td>{$posicion['nro_posicion']}</td>
                    <td>{$posicion['nro_fila']}</td>
                    <td>{$posicion['nro_estanteria']}</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
</div>
{include file="footer.tpl"}
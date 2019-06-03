{include file="header.tpl"}

{include file="nav.tpl"}
<div class="consulta">
    <h3 class="titulos">Listar Posiciones Cliente</h3>
    <form method="post" class="input-group mb-3" action="listarposicionescliente">
        <input type="text" class="form-control" placeholder="Cuit del Cliente" aria-label="cuit_cliente" name="cuit_cliente" aria-describedby="basic-addon2">
        <button class="btn btn-outline-secondary" type="submit">Buscar</button>
    </form>
</div>
{include file="footer.tpl"}
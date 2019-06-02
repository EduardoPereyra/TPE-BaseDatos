{include file="header.tpl"}

{include file="nav.tpl"}
<div class="consulta">
    <h3 class="titulos">Listar Clientes Con Vencimiento En Tantos Dias</h3>
    <form method="get" class="consulta input-group" action="home">
		<input type="text" class="form-control" placeholder="Dias" aria-label="dias" name="dias" aria-describedby="basic-addon2">
        <button class="btn btn-outline-secondary" type="submit">Listar Vencimiento</button>
    </form>
</div>
{include file="footer.tpl"}
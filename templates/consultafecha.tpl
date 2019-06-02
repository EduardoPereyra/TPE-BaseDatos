{include file="header.tpl"}

{include file="nav.tpl"}
<div class="consulta" >
    <h3 class="titulos">Listar Posiciones Libre en Fecha</h3>
    <form method="get" class="consulta input-group" action="home">
		<input type="text" class="form-control" placeholder="Dia" aria-label="dia" name="dia" aria-describedby="basic-addon2">
		<input type="text" class="form-control" placeholder="Mes" aria-label="mes" name="mes" aria-describedby="basic-addon2">
		<input type="text" class="form-control" placeholder="Año" aria-label="anio" name="anio" aria-describedby="basic-addon2">
        <button class="btn btn-outline-secondary" type="submit">Buscar Fecha</button>
    </form>
</div>
{include file="footer.tpl"}
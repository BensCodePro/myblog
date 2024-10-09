<?php if($action == 'add'):?>

<div class="col-md-6 mx-auto">
  <form method="post" enctype="multipart/form-data">

    <h1 class="h3 mb-3 fw-normal">Crear Categorías</h1>

    <?php if (!empty($errors)):?>
      <div class="alert alert-danger">Por favor arregla los errores de abajo</div>
    <?php endif;?>

    <div class="form-floating">
      <input value="<?=old_value('category')?>" name="category" type="text" class="form-control mb-2" id="floatingInput" placeholder="Category">
      <label for="floatingInput">Usuario</label>
    </div>
      <?php if(!empty($errors['category'])):?>
      <div class="text-danger"><?=$errors['category']?></div>
      <?php endif;?>

    <div class="form-floating my-3">
      <select name="disabled" class="form-select">
          <option value="0">Si</option>
          <option value="1">No</option>
      </select>
      <label for="floatingInput">Active</label>
    </div>

    <a href="<?=ROOT?>/admin/categories">
        <button class="mt-4 btn btn-lg btn-primary" type="button">Atras</button>
    </a>
    <button class="mt-4 btn btn-lg btn-primary float-end" type="submit">Crear</button>
   
  </form>
</div>

<?php elseif($action == 'edit'):?>

<div class="col-md-6 mx-auto">
  <form method="post" enctype="multipart/form-data">

    <h1 class="h3 mb-3 fw-normal">Editar Categorías</h1>

    <?php if(!empty($row)):?>

        <?php if (!empty($errors)):?>
          <div class="alert alert-danger">Por favor arregla los errores de abajo</div>
        <?php endif;?>

        <div class="form-floating">
          <input value="<?=old_value('category', $row['category'])?>" name="category" type="text" class="form-control mb-2" id="floatingInput" placeholder="Username">
          <label for="floatingInput">Usuario</label>
        </div>
          <?php if(!empty($errors['category'])):?>
          <div class="text-danger"><?=$errors['category']?></div>
          <?php endif;?>

        <div class="form-floating my-3">
          <select name="disabled" class="form-select">
              <option <?=old_select('disabled','0',$row['disabled'])?> value="0">Si</option>
              <option <?=old_select('disabled','1',$row['disabled'])?> value="1">No</option>
          </select>
          <label for="floatingInput">Activo</label>
        </div>


        <a href="<?=ROOT?>/admin/categories">
            <button class="mt-4 btn btn-lg btn-primary" type="button">Atras</button>
        </a>
        <button class="mt-4 btn btn-lg btn-primary  float-end" type="submit">Guardar</button>
    <?php else:?>

        <div class="alert alert-danger text-center">¡Registro no encontrado!</div>
    <?php endif;?>

  </form>
</div>

<?php elseif($action == 'delete'):?>

<div class="col-md-6 mx-auto">
  <form method="post">

    <h1 class="h3 mb-3 fw-normal">Borrar Caregorías</h1>

    <?php if(!empty($row)):?>

        <?php if (!empty($errors)):?>
          <div class="alert alert-danger">Por favor arregla los errores de abajo</div>
        <?php endif;?>

        <div class="form-floating">
          <div class="form-control mb-2" ><?=old_value('category', $row['category'])?></div>
        </div>
          <?php if(!empty($errors['category'])):?>
          <div class="text-danger"><?=$errors['category']?></div>
          <?php endif;?>

        <div class="form-floating">
          <div class="form-control mb-2" ><?=old_value('slug', $row['slug'])?></div>
        </div>
          <?php if(!empty($errors['slug'])):?>
          <div class="text-danger"><?=$errors['slug']?></div>
          <?php endif;?>


        <a href="<?=ROOT?>/admin/categories">
            <button class="mt-4 btn btn-lg btn-primary" type="button">Atras</button>
        </a>
        <button class="mt-4 btn btn-lg btn-danger  float-end" type="submit">Borrar</button>
    <?php else:?>

        <div class="alert alert-danger text-center">¡Registro no encontrado!</div>
    <?php endif;?>

  </form>
</div>

<?php else:?>

<h4>
    Categorías :
    <a href="<?=ROOT?>/admin/categories/add">
        <button class="btn btn-primary">Agregar categorías</button>
    </a>
</h4>

<div class="table-responsive">
<table class="table">
    
    <tr>
        <th>#</th>
        <th>Categorías</th>
        <th>Slug</th>
        <th>Activo</th>
        <th>Acciones</th>
    </tr>
    <?php  
        $limit = 10;
        $offset = ($PAGE['page_number'] - 1) * $limit;

        $query = "select * from categories order by id desc limit $limit offset $offset";
        $rows = query($query);
    ?>

    <?php if(!empty($rows)):?>
        <?php foreach($rows as $row):?>
        <tr>
            <td><?=$row['id']?></td>
            <td><?=esc($row['category'])?></td>
            <td><?=$row['slug']?></td>
            <td><?=$row['disabled'] ? 'No':'Si'?></td>
            <td>
                <a href="<?=ROOT?>/admin/categories/edit/<?=$row['id']?>">
                    <button class="btn btn-warning text-white btn-sm"><i class="bi bi-pencil-square"></i></button>
                </a>
                <a href="<?=ROOT?>/admin/categories/delete/<?=$row['id']?>">
                    <button class="btn btn-danger btn-sm"><i class="bi bi-trash-fill"></i></button>
                </a>
            </td>
        </tr>
        <?php endforeach;?>
    <?php endif;?>
</table>

<div class="col-md-12 mb-4">
    <a href="<?=$PAGE['first_link']?>">
        <button class="btn btn-primary">Primera Página</button>
    </a>
    <a href="<?=$PAGE['prev_link']?>">
        <button class="btn btn-primary">Pagina anterior</button>
    </a>
    <a href="<?=$PAGE['next_link']?>">
        <button class="btn btn-primary float-end">Siguiente página</button>
    </a>
</div>
</div>

<?php endif;?>
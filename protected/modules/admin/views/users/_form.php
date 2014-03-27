<?php
/* @var $this UsersController */
/* @var $model Users */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'users-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Регістрація <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'Password'); ?>
		<?php echo $form->passwordField($model,'Password',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'Password'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Login'); ?>
		<?php echo $form->textField($model,'Login',array('size'=>16,'maxlength'=>16)); ?>
		<?php echo $form->error($model,'Login'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Username'); ?>
		<?php echo $form->textField($model,'Username',array('size'=>16,'maxlength'=>16)); ?>
		<?php echo $form->error($model,'Username'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Name'); ?>
		<?php echo $form->textField($model,'Name',array('size'=>48,'maxlength'=>48)); ?>
		<?php echo $form->error($model,'Name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Email'); ?>
		<?php echo $form->textField($model,'Email',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'Email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Address'); ?>
		<?php echo $form->textField($model,'Address',array('size'=>60,'maxlength'=>64)); ?>
		<?php echo $form->error($model,'Address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Comments'); ?>
		<?php echo $form->textArea($model,'Comments',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'Comments'); ?>
	</div>

<!--	<div class="row">-->
<!--		--><?php //echo $form->labelEx($model,'Birtday'); ?>
		<?php echo $form->textField($model,'Birtday'); ?>
<!--		--><?php //echo $form->error($model,'Birtday'); ?>
<!--	</div>-->

	<div class="row">
		<?php echo $form->labelEx($model,'Language'); ?>
		<?php echo $form->textField($model,'Language',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'Language'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Style'); ?>
		<?php echo $form->textField($model,'Style'); ?>
		<?php echo $form->error($model,'Style'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Role'); ?>
		<?php echo $form->textField($model,'Role'); ?>
		<?php echo $form->error($model,'Role'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Hasavatar'); ?>
		<?php echo $form->textField($model,'Hasavatar'); ?>
		<?php echo $form->error($model,'Hasavatar'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Зберезти' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
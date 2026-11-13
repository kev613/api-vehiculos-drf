from django.db import models


class Vehiculo(models.Model):
    marca = models.CharField(max_length=50)
    modelo = models.CharField(max_length=50)
    anio = models.PositiveSmallIntegerField()
    color = models.CharField(max_length=30)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'vehiculos'
        ordering = ['id']

    def __str__(self):
        return f'{self.marca} {self.modelo} ({self.anio})'

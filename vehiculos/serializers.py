from datetime import date

from rest_framework import serializers

from .models import Vehiculo


class VehiculoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vehiculo
        fields = ['id', 'marca', 'modelo', 'anio', 'color', 'created_at', 'updated_at']
        read_only_fields = ['id', 'created_at', 'updated_at']

    def validate_anio(self, value):
        if value < 1886 or value > date.today().year + 1:
            raise serializers.ValidationError('El año debe estar entre 1886 y el próximo año.')
        return value

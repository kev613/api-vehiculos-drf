from rest_framework.routers import DefaultRouter

from .views import VehiculoViewSet

router = DefaultRouter(trailing_slash=False)
router.register('vehiculos', VehiculoViewSet, basename='vehiculo')

urlpatterns = router.urls

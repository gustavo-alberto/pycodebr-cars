from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from apps.cars.forms import CarModelForm
from apps.cars.models import Car


@method_decorator(login_required(login_url="login"), name="dispatch")
class CarsListView(ListView):
    model = Car
    template_name = "cars.html"
    context_object_name = "cars"

    def get_queryset(self):
        cars = super().get_queryset().order_by("model")
        search = self.request.GET.get("search")
        if search:
            cars = cars.filter(model__icontains=search)
        return cars


@method_decorator(login_required(login_url="login"), name="dispatch")
class CarDetailView(DetailView):
    model = Car
    template_name = "car_detail.html"


@method_decorator(login_required(login_url="login"), name="dispatch")
class NewCarCreateView(CreateView):
    model = Car
    form_class = CarModelForm
    template_name = "new_car.html"
    success_url = "/cars/"


@method_decorator(login_required(login_url="login"), name="dispatch")
class CarUpdateView(UpdateView):
    model = Car
    form_class = CarModelForm
    template_name = "car_update.html"

    def get_success_url(self):
        return reverse_lazy("car_detail", kwargs={"pk": self.object.pk})


@method_decorator(login_required(login_url="login"), name="dispatch")
class CarDeleteView(DeleteView):
    model = Car
    template_name = "car_delete.html"
    success_url = "/cars/"

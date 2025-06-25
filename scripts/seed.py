from apps.cars.models import Brand, Car, CarInventory


def run(*args):
    """
    Seed script to populate the database with some car brands and models.

    Usage:
    >>> python manage.py runscript seed
    """

    print("Running cars seed...")

    # Clear existing data
    Car.objects.all().delete()
    Brand.objects.all().delete()
    CarInventory.objects.all().delete()

    # Dictionary of brands and one well-known model for each
    cars_data = {
        "Volkswagen": "Gol",
        "Fiat": "Uno",
        "Chevrolet": "Onix",
        "Ford": "Ka",
        "Toyota": "Corolla",
        "Honda": "Civic",
        "Hyundai": "HB20",
        "Renault": "Sandero",
        "Peugeot": "208",
        "Nissan": "March",
    }

    # Create brands and cars
    for brand_name, car_model in cars_data.items():
        brand = Brand.objects.create(name=brand_name)

        Car.objects.create(
            model=car_model,
            brand=brand,
            factory_year=2020,
            model_year=2021,
            plate=f"ABC{len(car_model)}{len(brand_name)}",
            value=50000.0 + len(brand_name) * 1000,
            bio=f"O {car_model} da {brand_name} é um carro popular e um dos mais vendidos do Brasil.",
        )

    print("Seed completed!")

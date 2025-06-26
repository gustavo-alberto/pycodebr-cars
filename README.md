# pycodebr-cars

A Django project for car registration and management, developed as part of the Django Master course by Pycodebr.

## Features

- Register, edit, and delete cars
- Register car brands
- Upload car photos
- User authentication (login, logout, registration)
- Search cars by model
- Django admin panel

## Technologies

- Python
- Django
- PostgreSQL
- Docker / Docker Compose

## Project Structure

```
apps/
  accounts/   # User authentication
  cars/       # Car and brand logic
core/         # Django project settings
requirements/ # Project requirements
scripts/      # Utility scripts (e.g., seed)
```

## Installation

### Prerequisites

- Docker and Docker Compose installed
- (Optional) Python 3.13 and pip, if running locally without Docker

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/your-username/pycodebr-cars.git
   cd pycodebr-cars
   ```

2. Copy `.env.example` to `.env` and adjust variables if needed.

3. Build and start the containers:

   ```sh
   docker-compose up --build
   ```

4. Access the app at [http://localhost:8000/cars/](http://localhost:8000/cars/)

### Running Locally (without Docker)

1. Create and activate a virtual environment:

   ```sh
   python -m venv venv
   source venv/bin/activate  # Linux/Mac
   venv\Scripts\activate     # Windows
   ```

2. Install dependencies:

   ```sh
   pip install -r requirements/requirements.txt
   ```

3. Set up PostgreSQL and configure your `.env` file.

4. Run migrations:

   ```sh
   python manage.py migrate
   ```

5. Seed the database with example data:

   ```sh
   python manage.py runscript seed
   ```

6. Start the server:
   ```sh
   python manage.py runserver
   ```

## Useful Commands

- Run migrations:
  ```sh
  make migrate
  ```
- Seed the database:
  ```sh
  make seed
  ```

## License

MIT

---

Project for educational

# Full stack SurveyMaker with Laravel, VueJS and Tailwindcss

![Dashboard](https://res.cloudinary.com/dbiliw2ja/image/upload/v1700209232/r3cpl6hosto3zmbsgadb.png)
![Surveys](https://res.cloudinary.com/dbiliw2ja/image/upload/v1700209232/enqnbmagrj4iwdzy52ye.png)
![Create/edit](https://res.cloudinary.com/dbiliw2ja/image/upload/v1700209231/wa3mrz49krtghkvsurle.png)
![Public-view]()

### Prerequisites

**Composer**

**Laravel 8**

**NodeJS**

### Cloning the repository

```shell
git clone https://github.com/tuanloc288/vue-survey-maker.git
```

### Setup

# Backend

1. After you clone the project, go to the project root directory and run

```shell
composer install
php artisan key:generate
php artisan config:cache
php artisan migrate
```

# Database

1. First you will have to create a database on phpmyadmin (xampp) with whatever name you like
2. After that, import laravel_vue_survey.sql into that newly created db
3. Then copy .env.example into .env file and adjust the value of DB_DATABASE with the name as your choose previously (also change the value of DB_USERNAME and DB_PASSWORD if needed)
4. Finally run the command below

```shell
php artisan serve
```

# Frontend

1. Navigate to vue folder using

```shell
cd vue
```

2. Run the command below

```shell
npm install
```

3. Then copy vue/.env.example into vue/.env and specify your backend URL (default http://localhost:8000)
4. Lastly run

```shell
npm run dev
```

## Account with surveys
email: testerone@gmail.com 
password: Loc123456.

## Account without survey
email: testertwo@gmail.com 
password: Loc123456.
# erDiagram

    COUNTRY {
        int id PK "Primary Key"
        varchar name "Country Name"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    FILE {
        int id PK "Primary Key"
        varchar file_name "File Name"
        varchar mime_type "MIME Type"
        varchar key "File Key"
        varchar url "File URL"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    PERSON {
        int id PK "Primary Key"
        varchar first_name "First Name"
        varchar last_name "Last Name"
        text biography "Biography"
        date date_of_birth "Date of Birth"
        varchar gender "Gender ('male', 'female', 'other')"
        int country_id FK "Foreign Key to Country"
        int primary_photo_id FK "Foreign Key to File"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    USER {
        int id PK "Primary Key"
        varchar username "Username (Unique)"
        varchar first_name "First Name"
        varchar last_name "Last Name"
        varchar email "Email (Unique)"
        varchar password "Password"
        int avatar_id FK "Foreign Key to File"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    MOVIE {
        int id PK "Primary Key"
        varchar title "Title"
        text description "Description"
        decimal budget "Budget"
        date release_date "Release Date"
        interval duration "Duration"
        int director_id FK "Foreign Key to Person"
        int country_id FK "Foreign Key to Country"
        int poster_id FK "Foreign Key to File"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    GENRE {
        int id PK "Primary Key"
        varchar name "Genre Name"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    MOVIE_GENRE {
        int movie_id PK, FK "Primary Key and Foreign Key to Movie"
        int genre_id PK, FK "Primary Key and Foreign Key to Genre"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    CHARACTER {
        int id PK "Primary Key"
        varchar name "Character Name"
        text description "Description"
        varchar role "Role ('leading', 'supporting', 'background')"
        int movie_id FK "Foreign Key to Movie"
        int person_id FK "Foreign Key to Person"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    USER_FAVORITE_MOVIE {
        int user_id PK, FK "Primary Key and Foreign Key to User"
        int movie_id PK, FK "Primary Key and Foreign Key to Movie"
        timestamp created_at "Record Creation Time"
        timestamp updated_at "Record Update Time"
    }

    %% Relationships
    COUNTRY ||--o{ PERSON : "has"
    COUNTRY ||--o{ MOVIE : "has"
    FILE ||--o{ PERSON : "has"
    FILE ||--o{ USER : "has"
    FILE ||--o{ MOVIE : "has"
    PERSON ||--o{ MOVIE : "directs"
    MOVIE ||--o{ CHARACTER : "has"
    PERSON ||--o{ CHARACTER : "plays"
    MOVIE ||--o{ MOVIE_GENRE : "has"
    GENRE ||--o{ MOVIE_GENRE : "has"
    USER ||--o{ USER_FAVORITE_MOVIE : "likes"
    MOVIE ||--o{ USER_FAVORITE_MOVIE : "liked by"

![ER Diagram](https://mermaid.ink/img/pako:eNrNV21P4kAQ_iubJgZN0ChSRb4pgmdOxFQwuQtJs7QDbGy7ve3Wk0P_-81uW4FSOOVyh_1AZ5ZnZzvPvOzu1HC4C0bdAHHJ6EhQvx8QfBqd3m3X-kamiaoeFkjCXHL3lfSNO8F8KibkK0z6xgzyRIUzpoIE1AdENXgcSETdojoPk8yHSFI_JI4AKsG1qUS4BQ4XLmmoMcYD0mWrpsWhuzStp8cWJr32g0RoXd80N3RlyDywU39aKC85kwF9XNiWk1AB29ftJumiXAR8hElma8WasfAyRM-62Spzd03rvnO7MXcikjPyUFnJnkdnyBtaAJTwLMmAcUzRcKwIvMjkeZR2RP3YfGgPmJBjRF6qQT4kF0ovWnwEgQsCkVeJsFvyqQelMikNIZO4HIMo7c1PV0w4SYrbyEhLMdLiAtgoUIwQyUlaAflZYcKbHY655KvmqvhvNfa9-6a1YeTjCEQazV4m7vYC9iOGvX-dKRkQQ8dUHTX1e93qIY2in4oN9CsV8xGjT1RS8WlD1e48XG_a4SSTniKzq95LJedC5AgW6u_FUpppC2UHDi7hkUHsjkB98oUWlipTgAc0AlsryjGtElWgOcJBPKE9NxY0WzkV84FxmQBH8pWhuQMRLc_asGx5hB_2aZPgqnlrNf9ux8YGKGD7-7VOZ7vQH58_MbC1V-UkDHOeERpgbBbD0lYT8pEcKT8_YkUTs1VOGl_OrfNGd-OWnJ3JUKYOpnHxDvuucs9MCq4bh6VeuyWsZZcFI7VZRnEYciFTbUCdx5HAknKX98-3cBZVVGHoQl3Q7y_3rWybduv8oWNdd5t2YWdW2-NHsk_toSuZ27gQ_jszOzsEW762Go1ZGC1eNV5e9vf5NDtx1tHkmEaZjRwoYTWH0af8tVbmEfp0s-b_wiVSs0uQZBd6gyV_pKhZ4a41tggLPTopNjffG3MGk8E_47TrczTks1XBPfYIxR-wboZLBrr5GGXDB4EHLxevljr5-wYeoFVOaLqoeFSwV8TRWPL7SeAY9SH1Iigb2ClG4zctybH0bvo2GtLAqE-NZ6O-X60eH5iVo9qJeVwxzepZ2ZjgKEoHtbPq2Wnt-Oj08Ng0X8vGL87RwtHBqVmp1czaYeXwpGqeVcoGuAxPEO3kIqzvw3qF7xovRQyvvwGtK7PR?type=png)


### Пояснення

- **COUNTRY**: зберігає інформацію про країни.
- **FILE**: зберігає інформацію про файли (аватари, постери тощо).
- **PERSON**: зберігає інформацію про людей (актори, режисери тощо).
- **USER**: зберігає інформацію про користувачів додатка.
- **MOVIE**: зберігає інформацію про фільми.
- **GENRE**: зберігає інформацію про жанри фільмів.
- **MOVIE_GENRE**: зв'язок багато до багатьох між фільмами і жанрами.
- **CHARACTER**: зберігає інформацію про персонажів у фільмах.
- **USER_FAVORITE_MOVIE**: зв'язок багато до багатьох між користувачами і улюбленими фільмами.

### Взаємозв'язки

- Країна може мати багато людей і фільмів.
- Файл може бути аватаром користувача, постером фільму або фотографією людини.
- Людина може бути режисером фільму або грати персонажа у фільмі.
- Фільм може мати багато персонажів і жанрів.
- Користувач може мати багато улюблених фільмів.


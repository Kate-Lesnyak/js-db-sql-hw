# erDiagram

    COUNTRY {
        int id PK
        varchar name
        timestamp created_at
        timestamp updated_at
    }

    FILE {
        int id PK
        varchar file_name
        varchar mime_type
        varchar key
        varchar url
        timestamp created_at
        timestamp updated_at
    }

    PERSON {
        int id PK
        varchar first_name
        varchar last_name
        text biography
        date date_of_birth
        varchar gender
        int country_id FK
        int primary_photo_id FK
        timestamp created_at
        timestamp updated_at
    }

    USER {
        int id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        int avatar_id FK
        timestamp created_at
        timestamp updated_at
    }

    MOVIE {
        int id PK
        varchar title
        text description
        decimal budget
        date release_date
        interval duration
        int director_id FK
        int country_id FK
        int poster_id FK
        timestamp created_at
        timestamp updated_at
    }

    GENRE {
        int id PK
        varchar name
        timestamp created_at
        timestamp updated_at
    }

    MOVIE_GENRE {
        int movie_id PK, FK
        int genre_id PK, FK
        timestamp created_at
        timestamp updated_at
    }

    CHARACTER {
        int id PK
        varchar name
        text description
        varchar role
        int movie_id FK
        int person_id FK
        timestamp created_at
        timestamp updated_at
    }

    USER_FAVORITE_MOVIE {
        int user_id PK, FK
        int movie_id PK, FK
        timestamp created_at
        timestamp updated_at
    }

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

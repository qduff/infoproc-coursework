export DATABASE_URL="sqlite:astroids_lobby.db"

sqlx db drop
sqlx db create
sqlx migrate run
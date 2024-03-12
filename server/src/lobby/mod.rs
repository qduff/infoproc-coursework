use sqlx::sqlite::SqlitePool;
use std::env;
use anyhow;

pub fn donothing(){
    println!("doing nothing");
    return;
}

pub async fn create_player(name: &String, secret: &String) -> anyhow::Result<i64> {
    println!("adding player to database");
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;
    let mut conn = pool.acquire().await?;

    // Insert the task, then obtain the ID of this row
    let id = sqlx::query!(
        r#"
INSERT INTO players ( name, secret )
VALUES ( ?1, ?2)
        "#,
        name, secret
    )
    .execute(&mut *conn)
    .await?
    .last_insert_rowid();
    Ok(id)
}

pub async fn get_player_id(name: &String) -> anyhow::Result<i64>{
    println!("getting player id");
    let pool = SqlitePool::connect(&env::var("DATABASE_URL")?).await?;

    // Insert the task, then obtain the ID of this row
    let result = sqlx::query!(
        r#"
SELECT id
FROM players
WHERE name=?1
        "#,
        name
    )
    .fetch_one(&pool)
    .await?;

    Ok(result.id)
}
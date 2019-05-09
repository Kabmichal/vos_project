insert into users(name,email, created_at, updated_at,password_digest,remember_digest,admin) select concat('User ', i), concat('User@nwm',i),now(), now(),'$2a$10$XMEKMNcSZDHc7pGvknXdjekBV9q535bH2UKnAt6fCkrt5yvOQfcQ6','$2a$10$XMEKMNcSZDHc7pGvknXdjekBV9q535bH2UKnAt6fCkrt5yvOQfcQ6', false from generate_series(1, 100000) s(i);

insert into animals(name, user_id, created_at, updated_at, animal_type_id) select concat('anima19',i),i, now(), now(),2 from generate_series(11155154,11249020) s(i);

insert into foods(name, calories, user_id,created_at, updated_at) select concat('food1',i),i%100,i, now(), now() from generate_series(11155154,11249020) s(i);

insert into animal_foods(count, time, animal_id, created_at, updated_at, food_id, "current_date") select i%100,'13:23:00',i, now(), now(),8+i%210051, '2019-05-07'
from generate_series(210051,355519) s(i);

insert into homes(name, size, user_id, created_at, updated_at) select concat('food1',i),i%100,i, now(), now() from generate_series(11155154,11249020) s(i);

insert into home_enviroments(temperature, humidity, date, time, home_id, created_at, updated_at) select i%40, i%20, '2019-05-07','13:23:00', i, now(), now() from generate_series(210051,355519) s(i);
/* users(id, name NN, email NN UK, wallet DF 0.0, country) */
INSERT INTO users VALUES (1, 'EmotionalPanda', 'roovvv@panda.com', 9000.00, 'USA');
INSERT INTO users VALUES (2, 'SUPERGERALTOBROS', 'geralto@rivia.com', 2.00, 'Novigrad');
INSERT INTO users VALUES (3, 'HuninoSayoko', 'weeb@owo.com', 1000.00, 'Japan');
INSERT INTO users VALUES (4, 'LastLombax', 'ratchet@clank.com', 50.00, 'Veldin');
INSERT INTO users VALUES (5, 'ShootyMcFace', 'shoot@face.com', 0.00, 'Pandora');
INSERT INTO users VALUES (6, 'tinyTINA', 'cookie_conossieur@badonkadonks.com', 13.00, 'Pandora');

/* studio(id, name NN UK , description) */
INSERT INTO studio VALUES (1, '2K', '2K develops and publishes critically-acclaimed franchises such as BioShock, Borderlands, Sid Meier’s Civilization, XCOM, WWE 2K, and NBA 2K.');
INSERT INTO studio VALUES (2, 'GearBox', 'Growing developer studio famous for the Borderlands Universe');
INSERT INTO studio VALUES (3, 'CD PROJEKT RED', 'CD PROJEKT RED is a development studio founded in 2002. Our mission is to tell emotional stories riddled with meaningful choices and consequences, as well as featuring characters gamers can truly connect with.');
INSERT INTO studio VALUES (4, 'Telltale Games', 'We make story-driven games based on The Walking Dead, Guardians of the Galaxy, Minecraft, Batman, and more!');

/* game(id, title NN, price NN, rating DF 50, publisher -> Studio, developer -> Studio) */
INSERT INTO game VALUES (1, 'Borderlands', 20.0, 93.0, 2, 1);
INSERT INTO game VALUES (2, 'The Witcher 3', 30.0, 95.0, 3, 3);
INSERT INTO game VALUES (3, 'Bioshock', 22.2, 89.3, 1, 1);
INSERT INTO game VALUES (4, 'Tales From The Borderlands', 18.5, 73.5, 4, 1);

/* ownership(users -> users, game -> game) */
INSERT INTO ownership VALUES (6, 4);
INSERT INTO ownership VALUES (6, 1);
INSERT INTO ownership VALUES (4, 1);
INSERT INTO ownership VALUES (5, 1);
INSERT INTO ownership VALUES (4, 2);
INSERT INTO ownership VALUES (4, 3);
INSERT INTO ownership VALUES (4, 4);
INSERT INTO ownership VALUES (1, 1);
INSERT INTO ownership VALUES (1, 3);

/* wishlist(users -> users, game -> game) */
INSERT INTO wishlist VALUES (6, 3);
INSERT INTO wishlist VALUES (6, 2);
INSERT INTO wishlist VALUES (2, 2);
INSERT INTO wishlist VALUES (3, 1);
INSERT INTO wishlist VALUES (5, 4);

/* review(users -> users, game -> game, body, rating NN <1-true>) */
INSERT INTO review VALUES (6, 1, "There were chocolate chip cookies!!!", 1);
INSERT INTO review VALUES (6, 4, "A fine addition to the series.", 1);
INSERT INTO review VALUES (5, 1, "Meh", 2);

/* achievement(id, name NN, description NN, game -> Game) */
INSERT INTO achievement VALUES (1, 'Shoot me in the face!', 'You shot Shooty McFace in the knee and chest before shooting him in the face.', 1);
INSERT INTO achievement VALUES (2, 'Finger gun fighting', 'Congratulations, you won the finger gun fight!', 4);
INSERT INTO achievement VALUES (3, 'Big Daddy', 'You defetead your first Big Daddy', 3);
INSERT INTO achievement Values (4, 'Broken Bed', 'You made the decision that lead Yennefer to destroy the bed', 2);

/* users_achievement(users -> users, achievement -> achievement) */
INSERT INTO users_achievement VALUES (5, 1);
INSERT INTO users_achievement VALUES (6, 1);
INSERT INTO users_achievement VALUES (4, 1);
INSERT INTO users_achievement VALUES (2, 1);
INSERT INTO users_achievement VALUES (2, 4);
INSERT INTO users_achievement VALUES (4, 3);

/* follow_studio(users -> users, studio -> studio) */
INSERT INTO follow_studio VALUES (6, 1);
INSERT INTO follow_studio VALUES (6, 2);
INSERT INTO follow_studio VALUES (1, 4);
INSERT INTO follow_studio VALUES (2, 3);
INSERT INTO follow_studio VALUES (2, 4);
INSERT INTO follow_studio VALUES (3, 1);
INSERT INTO follow_studio VALUES (3, 2);
INSERT INTO follow_studio VALUES (3, 4);
INSERT INTO follow_studio VALUES (5, 3);

/* friendship(user1 -> users, user2 -> users CK user2 != user1) */
INSERT INTO friendship VALUES (1, 3);
INSERT INTO friendship VALUES (1, 5);
INSERT INTO friendship VALUES (2, 4);
INSERT INTO friendship VALUES (2, 6);
INSERT INTO friendship VALUES (3, 5);
INSERT INTO friendship VALUES (4, 6);
INSERT INTO friendship VALUES (4, 5);
INSERT INTO friendship VALUES (5, 6);

/* communities(id, name NN) */
INSERT INTO communities VALUES (1, 'Chocolate chip cookies connoisseurs');
INSERT INTO communities VALUES (2, 'Whip the raisin abdomination of the world');
INSERT INTO communities VALUES (3, 'School of the Wolf');
INSERT INTO communities VALUES (4, 'Children of the Vault');
INSERT INTO communities VALUES (5, 'Sorcerers');

/* post(id, title NN, body NN, rating DF 50, author -> users, community -> communities) */
INSERT INTO post VALUES (1, 'Torgues betrayal', 'Today the vaul hunter went to one of Mr''s Torgue ventures and I found out that he has raisin cookies! How can he be such a monster??????', 97.3, 6, 2);
INSERT INTO post VALUES (2, 'We want you!', 'We, the witchers of the School of the Wolf, are looking for volunteers to the Trial of the Grasses. If you wish to apply, come join us in Kaer Morhen.', 56.0, 2, 3);
INSERT INTO post VALUES (3, 'CHILDREN VAULT', 'THEY DON''T SHOOT FACE, BUT BRAINWASHHHHHHHHHHHHHHHH', 23.1, 5, 4);

/* comment(id, body NN, rating DF 50, author -> users, post -> post) */
INSERT INTO comment VALUES (1, 'I can''t belive he did such thing', 87.8, 1, 1);
INSERT INTO comment VALUES (2, 'Maybe he had no such intentions, maybe it was just a mistake...', 32.7, 2, 1);
INSERT INTO comment VALUES (3, 'There is no way in hell I''m going, the survival rates are awful', 63.4, 4, 2);
INSERT INTO comment VALUES (4, 'SHOOT ME IN THE FACEEEEEEEEEEEE', 27.3, 5, 2);

/* privileges(users -> users, community -> communities, is_administrator DF false(0)) */
INSERT INTO privileges VALUES (1, 1, 0);
INSERT INTO privileges VALUES (4, 1, 0);
INSERT INTO privileges VALUES (6, 1, 1);

INSERT INTO privileges VALUES (1, 2, 0);
INSERT INTO privileges VALUES (3, 2, 0);
INSERT INTO privileges VALUES (4, 2, 0);
INSERT INTO privileges VALUES (6, 2, 1);

INSERT INTO privileges VALUES (1, 3, 0);
INSERT INTO privileges VALUES (2, 3, 1);
INSERT INTO privileges VALUES (3, 3, 0);
INSERT INTO privileges VALUES (4, 3, 0);

INSERT INTO privileges VALUES (1, 4, 0);
INSERT INTO privileges VALUES (5, 4, 1);

INSERT INTO privileges VALUES (3, 5, 0);
INSERT INTO privileges VALUES (4, 5, 0);
INSERT INTO privileges VALUES (6, 5, 1);


# README - Script Batch d'Importation de Fichiers SQL dans MySQL

## Description

Ce script batch permet d'importer plusieurs fichiers SQL dans une base de données MySQL. Il vérifie d'abord la connexion à la base de données, puis importe chaque fichier SQL spécifié dans le script. Les logs des opérations réussies et des erreurs sont enregistrés dans des fichiers de log distincts.

## Prérequis

- MySQL installé et accessible via la ligne de commande.
- Un utilisateur MySQL avec les permissions nécessaires pour exécuter les scripts SQL.
- Les fichiers SQL à importer doivent être présents dans un répertoire spécifié.
- Chemins corrects pour MySQL, les fichiers SQL et le répertoire de logs configurés dans le script.

## Configuration

1. Ouvrez le script batch (`import_sql.bat`) dans un éditeur de texte.
2. Configurez les variables suivantes en fonction de votre environnement :

   ```batch
   set DB_USER=db_user            :: Nom d'utilisateur de la base de données
   set DB_PASSWORD=db_password    :: Mot de passe de la base de données
   set DB_NAME=db_name            :: Nom de la base de données
   set WAMP_PATH=C:\path\to\mysql\bin   :: Chemin vers le répertoire contenant l'exécutable MySQL
   set SQL_PATH=C:\path\to\sql_files    :: Chemin vers le répertoire contenant les fichiers SQL
   set LOG_PATH=C:\path\to\log_directory :: Chemin vers le répertoire où les logs seront enregistrés
   ```

3. Listez les fichiers SQL à importer dans le bloc `for` :

   ```batch
   for %%f in (
       "table1.sql"
       "table2.sql"
       "table3.sql"
       ...
   ) do (
   ```

## Utilisation

1. Placez le script batch (`import_sql.bat`) dans un répertoire approprié.
2. Ouvrez une invite de commandes.
3. Exécutez le script en tapant :

   ```batch
   import_sql.bat
   ```

4. Le script va :
   - Créer le répertoire de logs s'il n'existe pas.
   - Vérifier la présence de l'exécutable MySQL dans le chemin spécifié.
   - Vérifier la présence du répertoire des fichiers SQL.
   - Tester la connexion à la base de données.
   - Importer chaque fichier SQL et enregistrer les résultats dans les fichiers de log.

## Logs

Les logs des opérations sont enregistrés dans le répertoire spécifié par la variable `LOG_PATH` :

- `test_connection.txt` : Résultats du test de connexion à la base de données.
- `import_log.txt` : Logs des importations réussies.
- `error_log.txt` : Logs des erreurs d'importation.

## Aide

Si vous rencontrez des problèmes lors de l'exécution du script, veuillez vérifier les points suivants :

- Les chemins spécifiés dans le script sont corrects.
- Les fichiers SQL existent dans le répertoire spécifié.
- Les permissions de l'utilisateur MySQL sont suffisantes pour exécuter les scripts SQL.
- Consultez les fichiers de log pour plus de détails sur les erreurs.

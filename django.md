# Django


### Auto Reload


When you run the Django development server, it keeps checking for changes in your
code. It reloads automatically, freeing you from manually reloading it after code
changes. However, it might not notice some actions, such as adding new files to your
project, so you will have to restart the server manually in these cases.

### WSGI / ASGI


To deploy Django in a production environment, you should run it as a WSGI application
using a web server, such as Apache, Gunicorn, or uWSGI, or as an ASGI application
using a server such as Daphne or Uvicorn.
### Default auto-incrementing primary key


By default, Django adds an auto-incrementing primary key field to each model. The
field type for this field is specified in each application configuration or globally
in the DEFAULT_AUTO_FIELD setting. When creating an application with the startapp
command, the default value for DEFAULT_AUTO_FIELD is BigAutoField. This is a 64-bit
integer that automatically increments according to available IDs. If you don't specify
a primary key for your model, Django adds this field automatically. You can also
define one of the model fields to be the primary key by setting primary_key=True on
it.

### DateTimeField and auto_now / auto_now_add


```python
from django.db import models
class Post(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)"
```

created: This is a DateTimeField field. We will use it to store the date and time
when the post was created. By using auto_now_add, the date will be saved automatically
when creating an object.

updated: This is a DateTimeField field. We will use it to store the last date and time
when the post was updated. By using auto_now, the date will be updated automatically
when saving an object.

Utilizing the auto_now_add and auto_now datetime fields in your Django models is
highly beneficial for tracking the creation and last modification times of objects.

### Enumeration


Django provides enumeration types that you can subclass to define choices simply.
These are based on the enum object of Python's standard library.

```python
class Status(models.TextChoices):
  DRAFT = 'DF', 'Draft'
  PUBLISHED = 'PB', 'Published'
```

Here, we define the enumeration class Status by subclassing models.TextChoices. The
available choices for the post status are DRAFT and PUBLISHED. Their respective values
are DF and PB, and their labels or readable names are Draft and Published.

We can access Post.Status.choices to obtain the available choices, Post.Status.names
to obtain the names of the choices, Post.Status.labels to obtain the human-readable
names, and Post.Status.values to obtain the actual values of the choices.

Post.Status.choices
[('DF', 'Draft'), ('PB', 'Published')]

```python
>>> Post.Status.labels
```

['Draft', 'Published']

```python
>>> Post.Status.values
```

['DF', 'PB']

```python
>>> Post.Status.names
```

['DRAFT', 'PUBLISHED']

```python
status = models.CharField(
	max_length=2,
	choices=Status,
	default=Status.DRAFT
```

)

We have added a new status field to the model that is an instance of CharField. It
includes a choices parameter to limit the value of the field to the choices in Status.
We have also set a default value for the field using the default parameter. We use
DRAFT as the default choice for this field

### Foreign Key


Django comes with an authentication framework that handles user accounts. The Django
authentication framework comes in the django.contrib.auth package and contains a User
model.

```python
from django.conf import settings
author = models.ForeignKey(
	settings.AUTH_USER_MODEL,
	on_delete=models.CASCADE,
	related_name='blog_posts'
```

)

Here, we import the project's settings and add an author field to the Post
model. This field defines a many-to-one relationship with the default user model,
meaning that each post is written by a user, and a user can write any number of posts.
For this field, Django will create a foreign key in the database using the primary key
of the related model.

The on_delete parameter specifies the behavior to adopt when the referenced object is
deleted. This is not specific to Django; it is a SQL standard. Using CASCADE, you
specify that when the referenced user is deleted, the database will also delete all
related blog posts.

We use related_name to specify the name of the reverse relationship, from User to
Post. This will allow us to access related objects easily from a user object by using
the user.blog_posts notation.

### Composite Primary Key


A composite key could be used for a new model to track a user's favorite posts, where
the important data comes from two foreign keys – first to the user, and then to the
post – and these columns help to ensure uniqueness in the composite key:

```python
class FavoritePost(models.Model):
	pk = models.CompositePrimaryKey(
		"user", "post"
	)
	user = models.ForeignKey(
		settings.AUTH_USER_MODEL,
		on_delete=models.CASCADE
	)
	post = models.ForeignKey(
		'blog.Post',
		on_delete=models.CASCADE
	)
	created = models.DateTimeField(auto_now_add=True)
```

### sqlmigrate


The sqlmigrate command takes the migration names and returns their SQL without
executing it.

### DB Table Name


Django generates the table names by combining the application name and the lowercase
name of the model (blog_post), but you can also specify a custom database name for
your model in the Meta class of the model using the db_table attribute.

### Default Indexes


SlugField fields imply an index by default.
Unique fields imply an index by default.
ForeignKey fields imply an index by default.

### Circular Relations & Lazy Relations


Sometimes, you might have two models that depend on each other - i.e. you end up with
a circular relationship.

Or you have a model that has a relation with itself.

Or you have a model that should have a relation with some built-in model (i.e. built
into Django) or a model defined in another application.

Below, you find examples for all three cases that include Django's solution for these
kinds of "problems": Lazy relationships. You can also check out the official docs in
addition.

1) Two models that have a circular relationship

```python
class Product(models.Model):
```

  # ... other fields ...
```python
  last_buyer = models.ForeignKey('User')
```

```python
class User(models.Model):
```

  # ... other fields ...
```python
  created_products = models.ManyToManyField('Product')
```

In this example, we have multiple relationships between the same two models. Hence we
might need to define them in both models. By using the model name as a string instead
of a direct reference, Django is able to resolve such dependencies.

2) Relation with the same model

```python
class User(models.Model):
```

  # ... other fields ...
```python
  friends = models.ManyToManyField('self')
```

The special self keyword (used as a string value) tells Django that it should form a
relationship with (other) instances of the same model.

3) Relationships with other apps and their models (built-in or custom apps)

```python
class Review(models.Model):
```

  # ... other fields ...
```python
  product = models.ForeignKey('store.Product') # '<appname>.<modelname>'
```

You can reference models defined in other Django apps (no matter if created by you,
via python manage.py startapp <appname> or if it's a built-in or third-party app) by
using the app name and then the name of the model inside the app.



## Django project


A Django project is the overall container for your application's settings and
configurations (e.g., database settings, installed apps, URL routing at the project
level). Django projects are composed of one or more "apps".



## Django App


An app is a self-contained module that handles a specific piece of
functionality (like a blog, a user management system, etc.)



## Django's MVT Architecture


Django's MVT (Model-View-Template) is a twist on the MVC pattern.

   The "View" part deals with user requests.

   The "Model" part manages data and talks to the database.

   And the "Template" part shows the data to users.



## Django ORM


The Django ORM (Object-Relational Mapping) lets developers work with databases in
Python. This means no need for raw SQL queries. It makes managing databases easy and
helps apps grow.

Using Django's ORM correctly is key to handling complex queries & avoiding slowdowns.



## django-admin


django-admin is Django's command-line utility for administrative tasks.



## manage.py


manage.py is automatically created in each Django project.

It does the same thing as django-admin but also sets the DJANGO_SETTINGS_MODULE
environment variable so that it points to your project's settings.py file.

Generally, when working on a single Django project, it's easier to use
manage.py than django-admin.



## Migrations


Migrations are Django's way of propagating changes you make to your models into your
database schema.

### Migration Commands


```
┌──────────────────┬───────────────────────────────────────────────────────────────┐
│ Command          │ Description                                                   │
├──────────────────┼───────────────────────────────────────────────────────────────┤
│ migrate          │ Responsible for applying and unapplying migrations.           │
├──────────────────┼───────────────────────────────────────────────────────────────┤
│ makemigrations   │ Responsible for creating new migrations based on the changes  │
│                  │ you have made to your models.                                 │
├──────────────────┼───────────────────────────────────────────────────────────────┤
│ sqlmigrate       │ Displays the SQL statements for a migration.                  │
├──────────────────┼───────────────────────────────────────────────────────────────┤
│ showmigrations   │ Lists a project's migrations and their status.                │
└──────────────────┴───────────────────────────────────────────────────────────────┘
```

You can think of migrations as a version control system for your database schema.
`makemigrations` is responsible for packaging up your model changes into individual
migration files - analogous to commits - and `migrate` is responsible for applying
those to your database.

The migration files for each app live in a "migrations" directory inside of that app,
and are designed to be committed to, and distributed as part of, its codebase. You
should be making them once on your development machine and then running the same
migrations on your colleagues' machines, your staging machines, and eventually your
production machines.

### Backend Support


```
┌────────────────┬─────────────────────────────────────────────────────────────────┐
│ DB Name        │ Support                                                         │
├────────────────┼─────────────────────────────────────────────────────────────────┤
│ PostgreSQL     │ Is the most capable in terms of schema support.                 │
├────────────────┼─────────────────────────────────────────────────────────────────┤
│ MySQL          │ Lacks support for transactions around schema alteration         │
│                │ operations, meaning that if a migration fails to apply you will │
│                │ have to manually unpick the changes in order to try again (it's │
│                │ impossible to roll back to an earlier point). MySQL also has a  │
│                │ relatively small limit on the combined size of all columns an   │
│                │ index covers. This means that indexes that are possible on      │
│                │ other backends will fail to be created under MySQL.             │
├────────────────┼─────────────────────────────────────────────────────────────────┤
│ SQLite         │ Has very little built-in schema alteration support. Django      │
│                │ attempts to emulate it. It is not recommended that you run and  │
│                │ migrate SQLite in a production environment.                     │
└────────────────┴─────────────────────────────────────────────────────────────────┘
```

### Migration Workflow


```
┌──────┬─────────────────────────────────┬──────────────────────────────────────────┐
│ Step │ Command                         │ Description                              │
├──────┼─────────────────────────────────┼──────────────────────────────────────────┤
│ 1    │ uv run manage.py makemigrations │ Create migrations. Your models will be   │
│      │                                 │ scanned and compared to the versions     │
│      │                                 │ currently contained in your migration    │
│      │                                 │ files, and then a new set of migrations  │
│      │                                 │ will be written out.                     │
├──────┼─────────────────────────────────┼──────────────────────────────────────────┤
│ 2    │ python manage.py migrate        │ Apply migrations to your database.       │
├──────┼─────────────────────────────────┼──────────────────────────────────────────┤
│ 3    │ commit                          │ Once the migration is applied, commit    │
│      │                                 │ the migration and the models change to   │
│      │                                 │ your version control system as a single  │
│      │                                 │ commit - that way, when other developers │
│      │                                 │ (or your production servers) check out   │
│      │                                 │ the code, they'll get both the changes   │
│      │                                 │ to your models and the accompanying      │
│      │                                 │ migration at the same time.              │
└──────┴─────────────────────────────────┴──────────────────────────────────────────┘
```

### Version control


Because migrations are stored in version control, you'll occasionally come across
situations where you and another developer have both committed a migration to the same
app at the same time, resulting in two migrations with the same number.

Don't worry - the numbers are just there for developers' reference, Django just cares
that each migration has a different name. Migrations specify which other migrations
they depend on - including earlier migrations in the same app - in the file, so it's
possible to detect when there's two new migrations for the same app that aren't
ordered.

When this happens, Django will prompt you and give you some options. If it thinks it's
safe enough, it will offer to automatically linearize the two migrations for you.

### Migration files


Migrations are stored as an on-disk format, referred to here as "migration files".
These files are actually normal Python files with an agreed-upon object layout,
written in a declarative style.

A basic migration file looks like this:

```python
from django.db import migrations, models
class Migration(migrations.Migration):
    dependencies = [("migrations", "0001_initial")]
```


operations - [ migrations.DeleteModel("Tribble"), migrations.AddField("Author",
"rating", models.IntegerField(default-0)), ]

What Django looks for when it loads a migration file (as a Python module) is a
subclass of django.db.migrations.Migration called Migration. It then inspects this
object for four attributes, only two of which are used most of the time: dependencies:
a list of migrations this one depends on. operations: a list of Operation classes that
define what this migration does.

The operations are the key; they are a set of declarative instructions which tell
Django what schema changes need to be made. Django scans them and builds an in-memory
representation of all of the schema changes to all apps, and uses this to generate the
SQL which makes the schema changes.

That in-memory structure is also used to work out what the differences are between
your models and the current state of your migrations; Django runs through all the
changes, in order, on an in-memory set of models to come up with the state of your
models last time you ran makemigrations. It then uses these models to compare against
the ones in your models.py files to work out what you have changed.

### Initial migrations


The "initial migrations" for an app are the migrations that create the first version
of that app's tables.

When the migrate --fake-initial option is used, these initial migrations are treated
specially. For an initial migration that creates one or more tables (CreateModel
operation), Django checks that all of those tables already exist in the database and
fake-applies the migration if so. Similarly, for an initial migration that adds one or
more fields (AddField operation), Django checks that all of the respective columns
already exist in the database and fake-applies the migration if so.

### Data migrations


As well as changing the database schema, you can also use migrations to change the
data in the database itself, in conjunction with the schema if you want.

Migrations that alter data are usually called "data migrations"; they're best written
as separate migrations, sitting alongside your schema migrations.

Django can't automatically generate data migrations for you, as it does with schema
migrations, but it's not very hard to write them. Migration files in Django are made
up of Operations, and the main operation you use for data migrations is RunPython.

To start, make an empty migration file you can work from (Django will put the file in
the right place, suggest a name, and add dependencies for you):

```bash
$ python manage.py makemigrations --empty yourappname
```

Then, open up the file; it should look something like this:

# Generated by Django A.B on YYYY-MM-DD HH:MM
```python
from django.db import migrations
class Migration(migrations.Migration):
    dependencies = [
        ("yourappname", "0001_initial"),
    ]
```

```python
    operations = []
```

Now, all you need to do is create a new function and have RunPython use it. RunPython
expects a callable as its argument which takes two arguments - the first is an app
registry that has the historical versions of all your models loaded into it to match
where in your history the migration sits, and the second is a SchemaEditor, which you
can use to manually effect database schema changes (but beware, doing this can confuse
the migration autodetector!)

Let's write a migration that populates our new name field with the combined values of
first_name and last_name. All we need to do is use the historical model and iterate
over the rows:

```python
from django.db import migrations def combine_names(apps, schema_editor): # We can't
import the Person model directly as it may be a newer # version than this migration
```

expects. We use the historical version. Person = apps.get_model("yourappname",
"Person") for person in Person.objects.all(): person.name = f"{person.first_name}
{person.last_name}" person.save() class Migration(migrations.Migration): dependencies
= [ ("yourappname", "0001_initial"), ] operations = [
migrations.RunPython(combine_names), ]

Once that's done, we can run python manage.py migrate as normal and the data migration
will run in place alongside other migrations.

You can pass a second callable to RunPython to run whatever logic you want executed
when migrating backwards. If this callable is omitted, migrating backwards will raise
an exception.

### Squashing migrations


You are encouraged to make migrations freely and not worry about how many you have;
the migration code is optimized to deal with hundreds at a time without much slowdown.
However, eventually you will want to move back from having several hundred migrations
to just a few, and that's where squashing comes in.

Squashing is the act of reducing an existing set of many migrations down to one (or
sometimes a few) migrations which still represent the same changes.

Django does this by taking all of your existing migrations, extracting their
Operations and putting them all in sequence, and then running an optimizer over them
to try and reduce the length of the list - for example, it knows that CreateModel and
DeleteModel cancel each other out, and it knows that AddField can be rolled into
CreateModel.

Once the operation sequence has been reduced as much as possible - the amount possible
depends on how closely intertwined your models are and if you have any RunSQL or
RunPython operations (which can't be optimized through unless they are marked as
elidable) - Django will then write it back out into a new set of migration files.

These files are marked to say they replace the previously-squashed migrations, so they
can coexist with the old migration files, and Django will intelligently switch between
them depending where you are in the history. If you're still part-way through the set
of migrations that you squashed, it will keep using them until it hits the end and
then switch to the squashed history, while new installs will use the new squashed
migration and skip all the old ones.

This enables you to squash and not mess up systems currently in production that aren't
fully up-to-date yet. The recommended process is to squash, keeping the old files,
commit and release, wait until all systems are upgraded with the new release (or if
you're a third-party project, ensure your users upgrade releases in order without
skipping any), and then remove the old files, commit and do a second release.

The command that backs all this is squashmigrations - pass it the app label and
migration name you want to squash up to, and it'll get to work:

```bash
$ ./manage.py squashmigrations myapp 0004
```

Will squash the following migrations: - 0001_initial - 0002_some_change -
0003_another_change - 0004_undo_something Do you wish to proceed? [y/N] y
Optimizing... Optimized from 12 operations to 7 operations. Created new squashed
migration
/home/andrew/Programs/DjangoTest/test/migrations/0001_squashed_0004_undo_something.py
You should commit this migration but leave the old ones in place; the new migration
will be used for new installs. Once you are sure all instances of the codebase have
applied the migrations you squashed, you can delete them. Use the squashmigrations
--squashed-name option if you want to set the name of the squashed migration rather
than use an autogenerated one.

Note that model interdependencies in Django can get very complex, and squashing may
result in migrations that do not run; either mis-optimized (in which case you can try
again with --no-optimize, though you should also report an issue), or with a
CircularDependencyError, in which case you can manually resolve it.

To manually resolve a CircularDependencyError, break out one of the ForeignKeys in the
circular dependency loop into a separate migration, and move the dependency on the
other app with it. If you're unsure, see how makemigrations deals with the problem
when asked to create brand new migrations from your models. In a future release of
Django, squashmigrations will be updated to attempt to resolve these errors itself.

Once you've squashed your migration, you should then commit it alongside the
migrations it replaces and distribute this change to all running instances of your
application, making sure that they run migrate to store the change in their database.

You must then transition the squashed migration to a normal migration by:

Deleting all the migration files it replaces.

Updating all migrations that depend on the deleted migrations to depend on the
squashed migration instead.

Removing the replaces attribute in the Migration class of the squashed
migration (this is how Django tells that it is a squashed migration).

Note

Once you've squashed a migration, you should not then re-squash that squashed
migration until you have fully transitioned it to a normal migration.

Pruning references to deleted migrations

If it is likely that you may reuse the name of a deleted migration in the future, you
should remove references to it from Django's migrations table with the migrate --prune
option.



## Django Commands


```
┌────────────────────────────────────────┬─────────────────────────────────────────┐
│ Command                                │ Description                             │
├────────────────────────────────────────┼─────────────────────────────────────────┤
│ uv run manage.py help                  │ Display list of the commands provided   │
│                                        │ by each application                     │
├────────────────────────────────────────┼─────────────────────────────────────────┤
│ uv run manage.py help <command>        │ Display a description of the given      │
│                                        │ command and a list of its available     │
│                                        │ options                                 │
├────────────────────────────────────────┼─────────────────────────────────────────┤
│ uv run manage.py startproject name     │ Creates a Django project directory      │
│ [directory]                            │ structure for the given project name in │
│                                        │ the current directory or the given      │
│                                        │ destination. By default, the new        │
│                                        │ directory contains manage.py and a      │
│                                        │ project package (containing a           │
│                                        │ settings.py and other files). If only   │
│                                        │ the project name is given, both the     │
│                                        │ project directory and project package   │
│                                        │ will be named <projectname> and the     │
│                                        │ project directory will be created in    │
│                                        │ the current working directory. If the   │
│                                        │ optional destination is provided,       │
│                                        │ Django will use that existing directory │
│                                        │ as the project directory, and create    │
│                                        │ manage.py and the project package       │
│                                        │ within it.                              │
├────────────────────────────────────────┼─────────────────────────────────────────┤
│ uv run manage.py test                  │ Runs tests for all installed apps.      │
├────────────────────────────────────────┼─────────────────────────────────────────┤
│ uv run manage.py runserver             │ Starts a lightweight development web    │
│                                        │ server on the local machine. By         │
│                                        │ default, the server runs on port 8000   │
│                                        │ on the IP address 127.0.0.1. You can    │
│                                        │ pass in an IP address and port number   │
│                                        │ explicitly.                             │
│                                        │                                         │
│                                        │ The development server automatically    │
│                                        │ reloads Python code for each request,   │
│                                        │ as needed. You don't need to restart    │
│                                        │ the server for code changes to take     │
│                                        │ effect. However, some actions like      │
│                                        │ adding files don't trigger a restart,   │
│                                        │ so you'll have to restart the server in │
│                                        │ these cases.                            │
│                                        │                                         │
│                                        │ If you're using Linux or MacOS and      │
│                                        │ install both pywatchman and the         │
│                                        │ Watchman service, kernel signals will   │
│                                        │ be used to autoreload the server        │
│                                        │ (rather than polling file modification  │
│                                        │ timestamps each second). This offers    │
│                                        │ better performance on large projects,   │
│                                        │ reduced response time after code        │
│                                        │ changes, more robust change detection,  │
│                                        │ and a reduction in power usage. Django  │
│                                        │ supports pywatchman 1.2.0 and higher.   │
│                                        │                                         │
│                                        │ When using Watchman with a project that │
│                                        │ includes large non-Python directories   │
│                                        │ like node_modules, it's advisable to    │
│                                        │ ignore this directory for optimal       │
│                                        │ performance.                            │
│                                        │                                         │
│                                        │ When you start the server, and each     │
│                                        │ time you change Python code while the   │
│                                        │ server is running, the system "check"   │
│                                        │ framework will check your entire Django │
│                                        │ project for some common errors. If any  │
│                                        │ errors are found, they will be printed  │
│                                        │ to standard output.                     │
│                                        │                                         │
│                                        │ Note that the default IP address,       │
│                                        │ 127.0.0.1, is not accessible from other │
│                                        │ machines on your network. To make your  │
│                                        │ development server viewable to other    │
│                                        │ machines on the network, use its own IP │
│                                        │ address (e.g. 192.168.2.1), 0 (shortcut │
│                                        │ for 0.0.0.0), 0.0.0.0, or :: (with IPv6 │
│                                        │ enabled). You can provide an IPv6       │
│                                        │ address surrounded by brackets (e.g.    │
│                                        │ [200a::1]:8000). This will              │
│                                        │ automatically enable IPv6 support.      │
│                                        │                                         │
│                                        │ Logging of each request and response of │
│                                        │ the server is sent to the               │
│                                        │ django.server logger.                   │
│                                        │                                         │
│                                        │ If the staticfiles contrib app is       │
│                                        │ enabled (default in new projects) the   │
│                                        │ runserver command will be overridden    │
│                                        │ with its own runserver command. It adds │
│                                        │ automatic serving of static files.      │
└────────────────────────────────────────┴─────────────────────────────────────────┘
```



## Django Templates


A template contains the static parts of the desired HTML output as well as some
special syntax describing how dynamic content will be inserted.

Django ships built-in backends for its own template system, called the Django
template language (DTL), and for the popular alternative Jinja2.

Rendering replaces variables with their values, which are looked up in the context,
and executes tags.

The syntax of the Django template language involves four constructs.

### Variables


A variable outputs a value from the context, which is a dict-like object mapping keys
to values.

Variables are surrounded by {{ and }} like this:

My first name is {{ first_name }}. My last name is {{ last_name }}.
With a context of {'first_name': 'John', 'last_name': 'Doe'}, this template renders:
My first name is John. My last name is Doe.

If a variable resolves to a callable, the template system will call it with no
arguments and use its result instead of the callable.

### Tags


Tags provide arbitrary logic in the rendering process.

This definition is deliberately vague. For example, a tag can output content, serve
as a control structure e.g. an "if" statement or a "for" loop, grab content from a
database, or even enable access to other template tags.

Tags are surrounded by {% and %}

Most tags accept arguments:
{% cycle 'odd' 'even' %}

Some tags require beginning and ending tags:
{% if user.is_authenticated %}Hello, {{ user.username }}.{% endif %}

### Filters


Filters transform the values of variables and tag arguments.

They look like this:

{{ django|title }}
With a context of {'django': 'the web framework for perfectionists with deadlines'},
this template renders to:
The Web Framework For Perfectionists With Deadlines

Some filters take an argument:
{{ my_date|date:"Y-m-d" }}

### Comments


Comments look like this:

{# this won't be rendered #}

A {% comment %} tag provides multi-line comments.

### Templates Summary


Templates allow us to define HTML documents with dynamic content, where the dynamic
content is set by Django based on data we generate in our views, which we then pass
into our templates with the render function for example.

The interpolation syntax {{ }} is used to render a value in the HTML document.

We can also use filters optionally if we want to, to adjust the look or the
formatting of certain values.

Besides interpolation, we also have tags.
```python
   - For example, the {% for %} tag for repeating content and rendering a list of
   content based on some data.
   - We also have the {% if %} tag to render content conditionally.
```

And then we have this important feature of template inheritance where we define a
base template with some blocks reserved in them, which will be replaced by the
inheriting templates.

And we then do inherit by using the {% extends %} tag and pointing at the base
template,

We insert the block tags in inheriting template as well to inject content into the
base template. We can inject anything - some text, some HTML tags or also some static
file imports.

For placing our templates, we use this best practice structure of repeating the app
name in the app specific templates folder to avoid name clashes and we're doing the
same for static files.

And we also learned about the feature of including template files to {% include %}
snippets into our templates and have nice feature which helps us with reusing code
and the whiting code duplication.

The overall goal with that is to keep our views files lean and to really focus on
the logic for extracting and transforming data here and not on formatting and
constructing HTML code. That's the task of the template.

### SQLite


"SQLite is a lightweight database that you can use with Django for development."

"SQLite comes bundled with Python 3 and can be used in any of your Python
applications."




## Building Static URLs Dynamically


Imagine, that you want to build a static URL where some part of the URL (e.g. the
filename) is actually stored in a variable that's exposed to the template.

So you might want to build the URL like this:

{% static "my_path/to/" + the_file %}

Here, "the_file" would be a variable holding the actual filename.

The above code would fail.

Instead, you can use the "add" filter provided by Django to construct this path
dynamically:

{% static "my_path/to/"|add:the_file %}



## Django Settings

### TEMPLATES


A list containing the settings for all template engines to be used with Django.

Each item of the list is a dictionary containing the options for an individual engine.

Here's a setup that tells the Django template engine to load templates from the
templates subdirectory inside each installed application:

```python
TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "APP_DIRS": True,
    },
```

]

The "DIR" key specifies directories where the template engine should look for
template source files, in search order.

The "APP_DIRS" key specifies Whether the engine should look for template source
files inside installed applications.

### STATICFILES_DIRS


This setting defines the additional locations the staticfiles app will traverse

```python
STATICFILES_DIRS = [
    "/home/special.polls.com/polls/static",
    "/home/polls.com/polls/static",
    "/opt/webfiles/common",
```

]

### DEBUG


DEBUG is a Boolean that turns the debug mode of the project on and off. If it is set
to True, Django will display detailed error pages when an uncaught exception is thrown
by your application. When you move to a production environment, remember that you have
to set it to False. Never deploy a site into production with DEBUG turned on because
you will expose sensitive project-related data.

### ALLOWED_HOSTS


ALLOWED_HOSTS is not applied while debug mode is on or when the tests are run. Once
you move your site to production and set DEBUG to False, you will have to add your
domain/host to this setting to allow it to serve your Django site.

### INSTALLED_APPS


INSTALLED_APPS is a setting you will have to edit for all projects.

This setting tells Django which applications are active for this site.

By default, Django includes the following applications:
   django.contrib.admin: An administration site.
   django.contrib.auth: An authentication framework.
   django.contrib.contenttypes: A framework for handling content types.
   django.contrib.sessions: A session framework.
   django.contrib.messages: A messaging framework.
   django.contrib.staticfiles: A framework for managing static files, such as CSS,
   JavaScript files, and images.

### DATABASES


"The settings.py file contains the database configuration for your project in the
DATABASES setting. The default configuration is a SQLite3 database."




## HttpRequest and HttpResponse


Django uses request and response objects to pass state through the system.

When a page is requested, Django creates an HttpRequest object that contains
metadata about the request. Then Django loads the appropriate view, passing the
HttpRequest as the first argument to the view function. Each view is responsible for
returning an HttpResponse object.

HttpRequest and HttpResponse are defined in the django.http module.

In contrast to HttpRequest objects, which are created automatically by Django,
HttpResponse objects are your responsibility. Each view you write is responsible for
instantiating, populating, and returning an HttpResponse.

Passing iterators

You can pass HttpResponse an iterator rather than strings. HttpResponse will consume
the iterator immediately, store its content as a string, and discard it. Objects with
a close() method such as files and generators are immediately closed. If you need the
response to be streamed from the iterator to the client, you must use the
StreamingHttpResponse class instead.


## Django Tips


### Database Design


You will continuously be using Django's Model to design the database schema. Because
the schema has such a big impact on the rest of the project it's important to make
sure you've designed it correctly. You'll need to be very comfortable with Django's
Model to up-skill in database design. This will require you to understand all the
different types of table relations such as Foreign Keys, OneToOneFields, and
ManyToManyFields.

A good understanding of database design is the foundation of having a good
understanding of Django.

### Authentication and Authorization


The first step is to understand the difference between authentication and
authorization is. I recommend you to start by learning the built-in authentication
provided by Django. Django's auth module contains a lot of views and forms that make
up the authentication logic. Going through that code and understanding what each form
and view does will give you a good starting point for how it works underneath the
hood.

While learning the built-in authentication it would also be good to learn the
different types of authentication such as session and token authentication. If you
have a good understanding of these then you might want to look at JWT authentication.

If you have a solid understanding of authentication you'll then want to start going
through the most commonly used packages such as Django AllAuth. You'll most likely
make use of third-party packages to handle authentication because it's very
repetitive. So start becoming familiar with the available packages and what might be
best for your use-case.

### Flow of data


Part of understanding the flow of data is understanding how data moves between the
user and the database. This means understanding how data is retrieved from the
database, passed into the view, and displayed in the template. Likewise from the other
way around - understanding data being passed into a form, submitted to the view, and
stored in the database.

Take for example the Create action. To implement this action you will need to
implement a form that takes in data and creates a resource (normally through a Django
model). Django's Class-Based Views are very good at minimizing the amount of code
written in CRUD views.

### Static and media file configuration


One of the more challenging concepts is that of static and media files. This is
because the setup is different depending on whether you're in local development or
production. Understanding the difference between the two is important. I also
recommend learning about the S3 protocol and why it's advantageous to store your files
on a separate server using a service such as Digital Ocean Spaces.

### Deployment


This is one of the most important sections of web development. Today there are many
services you can use to deploy your Django project, but what's important to understand
is the fundamentals of how a Django server is run in production. A traditional setup
would involve manually setting up gunicorn and nginx on a server. A more modern
approach would be to use Docker and deploy the docker container.

### Integrating with 3rd party APIs


If you're able to integrate with APIs such as GitHub, Stripe, Slack, Twitter, and many
others, you're showing that you understand almost all of the fundamental aspects of
Django.

Today there are entire businesses built on top of other companies' APIs. So this skill
is a big one for me, and I think a lot of other companies that leverage APIs.

### Docker


Docker is a great tool for creating consistent environments between team members. If
you're joining a large team you'll most likely be working with Docker so developing
this skill beforehand will make your life easier.

### Building APIs


The Django Rest Framework is by far the most used project for building APIs. There's
an entire ecosystem of packages that integrate with the DRF for various functionality.

This step is definitely a challenging learning curve and I'd recommend you take it
slow if you're struggling. Understanding the core of Django is much more important
before diving into the DRF.

### Task Queuing


This is definitely the most project-dependent skill. Some projects don't have any need
```python
for asynchronous tasks. It's also a very difficult skill to master. A lot of
```

developers have shared their knowledge on asynchronous tasks because it's constantly
provided a set of new challenges and pains to deal with. I would consider this skill
an entire area to specialize in.


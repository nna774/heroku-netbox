#!/bin/bash
cd "$(dirname $0)/../netbox"
./netbox/manage.py shell --interface python << END
from django.contrib.auth.models import User
u=User.objects.get(username__exact='${SUPERUSER_NAME}')
u.set_password('${SUPERUSER_PASSWORD}')
u.save()

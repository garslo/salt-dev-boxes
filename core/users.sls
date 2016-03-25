garslo:
  user.present:
    - fullname: Gerrit Slopsema
    - shell: /bin/bash
    - groups:
      - sudo
  ssh_auth.present:
    - user: garslo
    - enc: ssh-rsa
    - names:
      - AAAAB3NzaC1yc2EAAAADAQABAAABAQCopdrPG2JWDobWxwbaX4ZUOCfa6nukdbAbrmgXBCySeOAe6vVSZ3kWs6I7TTrDllXRH/QCa/8Pmj1V/f+Q/AA+YRPMxYgUJcGeM0xgnyL/Cq3kRlEHnZXJnjZiMBLov5tT76jceEsLOvgmu0wZ4S8H5UkozFdh09+S1npV7qV/ocWb6YywcyrahO3VXBEqDw5HTlAv4sMmnqrorbY9ies4wTAVDJ1XWmXBwjqSg5wKtVgL/exZ5nwMfUuU1WWvH56eMt6hBvUbAofiJYlIlB5otz/5ofLt+5by3QfKe09zayMkDNo3yt9avw7U1ryRmal8i/RUe7x7c2iRBzeAuuLn
      - AAAAB3NzaC1yc2EAAAADAQABAAABAQC3fskEj5w9e7PFv5vFvulbqijdJ/sOB7+45VxqngqHyihFkh+nOkTbvy+3tWbAl8223Ri7CPurrxmZ5L72ZkxwodVRMjayNpixAWqlGqfsar809W18J6BbJwr25b0rbIcSFSnmzTbm77vLjeuKEaOtByfJhBT63tr/Don6JV/I59NrJiAamBivRYG/rFqxAurxO5MQjsHPSYogWbvsiTnb6atTbaKt8nHFOF0nhgKBWrEophs7BucIUsPpaexPeUF2t8T9DuHfPTYfvkwNc6zcmv93GktVOSF3RmR4YVsqB1fMHaM8SueIWyasRDrgku0xSnrrKJ9DcjrEBOLhCARx
  file.managed:
    - name: /home/garslo/.bashrc
    - source: salt://core/files/bashrc

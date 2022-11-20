FROM fedora
RUN dnf -y install pip && pip install hvac
COPY vault_test.py /
ENV write false
CMD python3 vault_test.py

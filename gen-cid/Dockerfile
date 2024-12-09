FROM python

RUN apt-get install git

RUN git clone https://github.com/hydrokhoos/CID-generator

RUN pip install py-cid pymultihash

CMD ["python3", "CID-generator/gen_cid.py", "/target"]

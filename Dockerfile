FROM xaerdna/modelsim

RUN apt purge python -y
RUN apt update

ENV PATH $PATH:/root/altera/15.0/modelsim_ase/bin
RUN ln -s /root/altera/15.0/modelsim_ase/linuxaloem /root/altera/15.0/modelsim_ase/linux_rh60

CMD ["bash"]

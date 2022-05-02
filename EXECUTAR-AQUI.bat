start /wait ARCHIVESRC/1/1.msi -m /quiet /passive
                                                              echo instalado com sucesso.
start /wait ARCHIVESRC/1/2.msi -m /quiet /passive
                                                              echo instalado com sucesso.
start /wait ARCHIVESRC/1/3.exe /verysilent /quiet /install
                                                              echo instalado com sucesso.
start /wait ARCHIVESRC/3/1.msi /quiet /passive
                                                              echo instalado com sucesso.
start /wait ARCHIVESRC/3/2.exe /verysilent /quiet /install
                                                              echo instalado com sucesso.
start /wait ARCHIVESRC/3/3.exe /verysilent /quiet /install
                                                              echo instalado com sucesso.
start /wait ARCHIVESRC/6/AREAPUBLIC.ps1
                                                              
start /wait VCREDISTS.BAT
                                                              echo instalado com sucesso.
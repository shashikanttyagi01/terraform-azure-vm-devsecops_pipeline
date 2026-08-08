\# Terraform Azure VM - DevSecOps Pipeline



This project provisions an Azure Virtual Machine using Terraform and is designed to be integrated with a GitHub Actions DevSecOps CI/CD pipeline.



\## Architecture



The planned workflow is:



Developer

&#x20;  |

&#x20;  | git push

&#x20;  v

GitHub Repository

&#x20;  |

&#x20;  v

GitHub Actions

&#x20;  |

&#x20;  +--> Secret Scanning - Gitleaks

&#x20;  |

&#x20;  +--> Terraform Format

&#x20;  |

&#x20;  +--> Terraform Validate

&#x20;  |

&#x20;  +--> Terraform Security Scan

&#x20;  |

&#x20;  +--> Terraform Plan

&#x20;  |

&#x20;  +--> Terraform Apply

&#x20;  |

&#x20;  v

Microsoft Azure

&#x20;  |

&#x20;  +--> Resource Group

&#x20;  |

&#x20;  +--> Virtual Network

&#x20;  |

&#x20;  +--> Subnet

&#x20;  |

&#x20;  +--> Network Security Group

&#x20;  |

&#x20;  +--> Public IP

&#x20;  |

&#x20;  +--> Network Interface

&#x20;  |

&#x20;  +--> Virtual Machine

&#x20;  |

&#x20;  +--> NGINX


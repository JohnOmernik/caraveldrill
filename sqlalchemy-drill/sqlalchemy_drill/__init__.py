__version__ = '0.8'

from sqlalchemy.dialects import registry

registry.register("drill", "sqlalchemy_drill.pyodbc", "DrillDialect_pyodbc")
registry.register("drill.pyodbc", "sqlalchemy_drill.pyodbc", "DrillDialect_pyodbc")

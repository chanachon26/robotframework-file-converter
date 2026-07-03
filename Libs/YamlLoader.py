import yaml

class YamlLoader:
    def load_file_paths(self, yaml_file: str):
        """
        โหลดไฟล์ .yaml และแปลงเป็น dictionary
        """
        with open(yaml_file, 'r', encoding='utf-8') as f:
            data = yaml.safe_load(f)
        return data
    
    def get_file_paths(self, config_file):
        """
        โหลดไฟล์ YAML และดึงข้อมูลที่เกี่ยวกับไฟล์ที่ต้องการดาวน์โหลด
        """
        with open(config_file, 'r') as f:
            config = yaml.safe_load(f)
        return config.get('files', [])
class Whisper::Message < Struct.new(:id, :from, :content, :sent_date, :has_read, :star_check)
  def self.parse_collection(xml)
    Hash.from_xml(xml)['messages'].map{|hsh| from_hash(hsh)}
  end
  
  def self.from_hash(hsh)
    ret = new(hsh['id'].to_i, hsh['from'], hsh['content'], DateTime.parse(hsh['sent_date']))
    ret.has_read = hsh['hasRead'].to_s == 'yes'
    ret.star_check = hsh['starCheck'].to_s == 'yes'
    ret
  end
end
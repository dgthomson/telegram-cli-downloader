CHAT_NAME = os.getenv('CHAT_NAME')

function cb_ok(extra, success, source)
    if success == 1 then
        print('@ Completed, moving')
        dest = string.gsub(source, '/incomplete/', '/complete/')
        os.rename(source, dest)
        os.execute('chmod 777 "' .. dest .. '"')
    end
end

function on_msg_receive (msg)
    if msg.from.print_name == CHAT_NAME then
        if msg.media then
            if msg.media.type == 'document' then
                print ('@ Downloading')
                load_document(msg.id, cb_ok, msg.id)
            elseif msg.media.type == 'video' then
                print ('@ Downloading')
                load_video(msg.id, cb_ok, msg.id)
            elseif msg.media.type == 'photo' then
                print ('@ Downloading')
                load_photo(msg.id, cb_ok, msg.id)
            elseif msg.media.type == 'audio' then
                print ('@ Downloading')
                load_audio(msg.id, cb_ok, msg.id)
            end
        end
    end
end
